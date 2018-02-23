import pandas as pd
import os

from shadow_report_api import create_message_with_attachment
from shadow_report_api import send_message
from shadow_report_config import get_db_config
from shadow_report_config import get_emails


emails = get_emails()
sendFrom = emails[0]
sendTo = emails[1]


def genreport():
    tmpfile = './shadowreport.csv'
    dbconfig = get_db_config()
    # Create Variables for database connection
    db_username = dbconfig[0]
    db_pass = dbconfig[1]
    db_uri = dbconfig[2]
    db_port = dbconfig[3]
    db_database = dbconfig[4]
    db_connection = "mysql+mysqlconnector://" + db_username + ":" \
                    + db_pass + "@" + db_uri + ":" + db_port + "/" + db_database
    df = pd.read_sql_table("vulnerabilities", db_connection)
    df.to_csv(tmpfile, index=False)
    message = create_message_with_attachment(sendFrom, sendTo, "Daily Shadow Report", "Daily Shadow Report", tmpfile)
    try:
        send_message(message)
    except:
        print("Unable to send message")
    os.remove(tmpfile)
