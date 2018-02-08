import pandas as pd
import datetime
import pdfkit as pdf
from jinja2 import Environment, FileSystemLoader
import os

from shadow_report_api import create_message_with_attachment
from shadow_report_api import send_message
from shadow_report_config import get_db_config
from shadow_report_config import get_emails

path_wkthtmlopdf = "/usr/local/bin/wkhtmltopdf"
config = pdf.configuration(wkhtmltopdf=path_wkthtmlopdf)
emails = get_emails()
sendFrom = emails[0]
sendTo = emails[1]


def genreport():
    env = Environment(loader=FileSystemLoader('.'))
    template = env.get_template("shadowreport.html")
    todays_date = datetime.date.today().strftime("%B %d, %Y")
    tmphtml = "tmp.html"
    tmppdf = "DailyShadowReport.pdf"
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
    df = df.to_html()
    template_vars = {"title": "Shadow Report " + todays_date, "shadow_table": df}
    html_out = template.render(template_vars)
    with open(tmphtml, "w") as fh:
        fh.write(html_out)
    pdf.from_file(tmphtml, tmppdf, configuration=config)
    os.remove(tmphtml)
    message = create_message_with_attachment(sendFrom, sendTo, "Daily Shadow Report", "Daily Shadow Report", tmppdf)
    send_message(message)
    os.remove(tmppdf)
