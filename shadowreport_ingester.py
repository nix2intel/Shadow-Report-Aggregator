# import needed submodules
import os
import shutil
import zipfile
import pandas as pd
from sqlalchemy import *


from shadow_report_api import get_reports
from shadow_report_api import create_message
from shadow_report_api import send_message
from shadowreport_generator import genreport
from shadow_report_config import get_db_config
from shadow_report_config import get_emails
from shadow_report_config import get_directories

# Create Variables for database connection
config = get_db_config()
db_username = config[0]
db_pass = config[1]
db_URI = config[2]
db_port = config[3]
db_database = config[4]
db_connection = "mysql+mysqlconnector://" + db_username + ":"\
                + db_pass + "@" + db_URI + ":" + db_port + "/" + db_database
# Create email item that stores config values to send out emails.
emails = get_emails()
sendFrom = emails[0]
sendTo = emails[1]
# set shadow report directory where .zip files are kept
dirs = get_directories()
reports_dir = dirs[0]
# This is a backup directory for keeping a copy of the csv files.
backup_dir = dirs[1]


# functions need to be defined before logic, this function connects to our shadowreport database,
# parses out the information and appends it to the database
def insert_database(document, tablename):
    engine = create_engine(db_connection)
    df = pd.io.parsers.read_csv(document, header=0)
    df.to_sql(tablename, engine, if_exists='append', index=False)


get_reports()

# this section parses our shadowdir for the dropped zip files and extracts them and removes the zip file
for item in os.listdir(reports_dir):
    if item.endswith(".zip"):
        file_name = reports_dir + item
        zip_ref = zipfile.ZipFile(file_name)
        zip_ref.extractall(reports_dir)
        zip_ref.close()
        os.remove(file_name)
# this section then goes to the shadowdir and gets the csv files and works with each database table
#  according to the name of the file. after insertion into the database it moves it to the backup directory.
for item in os.listdir(reports_dir):
    if item.endswith(".csv"):
        file_name = reports_dir + "/" + item
        if 'ntp' in file_name:
            tablename = 'ntp'
            document = file_name
            insert_database(document, tablename)
            shutil.move(file_name, backup_dir + item)
        elif 'snmp' in file_name:
            tablename = 'snmp'
            document = file_name
            insert_database(document, tablename)
            shutil.move(file_name, backup_dir + item)
        elif 'poodle' in file_name:
            tablename = 'poodle'
            document = file_name
            insert_database(document, tablename)
            shutil.move(file_name, backup_dir + item)
        elif 'telnet' in file_name:
            tablename = 'telnet'
            document = file_name
            insert_database(document, tablename)
            shutil.move(file_name, backup_dir + item)
        elif 'tftp' in file_name:
            tablename = 'tftp'
            document = file_name
            insert_database(document, tablename)
            shutil.move(file_name, backup_dir + item)
        elif 'vnc' in file_name:
            tablename = 'vnc'
            document = file_name
            insert_database(document, tablename)
            shutil.move(file_name, backup_dir + item)
        elif 'portmapper' in file_name:
            tablename = 'openportmapper'
            document = file_name
            insert_database(document, tablename)
            shutil.move(file_name, backup_dir + item)
        elif 'netbios' in file_name:
            tablename = 'netbios'
            document = file_name
            insert_database(document, tablename)
            shutil.move(file_name, backup_dir + item)
        elif 'sinkhole_http_drone' in file_name:
            tablename = 'sinkholehttpdrone'
            document = file_name
            insert_database(document, tablename)
            shutil.move(file_name, backup_dir + item)
        elif 'cisco_smart_install' in file_name:
            tablename = 'ciscosmartinstall'
            document = file_name
            insert_database(document, tablename)
            shutil.move(file_name, backup_dir + item)
        elif 'blacklist' in file_name:
            tablename = 'blacklist'
            document = file_name
            insert_database(document, tablename)
            shutil.move(file_name, backup_dir + item)
        elif 'botnet_drone' in file_name:
            tablename = 'botnet'
            document = file_name
            insert_database(document, tablename)
            shutil.move(file_name, backup_dir + item)
        else:
            message = create_message(sendFrom, sendTo, os.path.basename(file_name) + " has no entry",
                                     "File " + os.path.basename(
                                      file_name) + " does not have an entry in the shadowreports database.")
            send_message(message)
genreport()
