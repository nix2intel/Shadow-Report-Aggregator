from configparser import ConfigParser
import os

homedirectory = os.environ['HOME']


def create_creds():
    username = input("What is the database username: ")
    password = input("What is the database password: ")
    uri = input("What is the database URI: ")
    port = input("What is the database port: ")
    database = input("What is the database you would like to use: ")
    send_from = input("What email will do the sending: ")
    send_to = input("Who should receive the email address: ")
    reports_dir = input("Where would you like reports to download: ")
    backup_dir = input("Where would you like to backup reports: ")
    config = ConfigParser()
    config.add_section('Database')
    config.set('Database', 'username', username)
    config.set('Database', 'password', password)
    config.set('Database', 'uri', uri)
    config.set('Database', 'port', port)
    config.set('Database', 'database', database)
    config.add_section('Email')
    config.set('Email', 'send_from', send_from)
    config.set('Email', 'send_to', send_to)
    config.add_section('Directory')
    config.set('Directory', 'reports_dir',reports_dir )
    config.set('Directory', 'backup_dir', backup_dir)
    with open(homedirectory + "/.config/shadowReports.ini", "w") as configfile:
        config.write(configfile)
    configfile.close()
    print("Shadow Report  config successfully written, you may have to rerun your program.")
    exit(0)


def get_db_config():
    if os.path.isdir(homedirectory + "/.config"):
        if os.path.isfile(homedirectory + "/.config/shadowReports.ini"):
            config = ConfigParser()
            config.read(homedirectory + "/.config/shadowReports.ini")
            username = config.get('Database', 'username')
            password = config.get('Database', 'password')
            uri = config.get('Database', 'uri')
            port = config.get('Database', 'port')
            database = config.get('Database', 'Database')
            return username, password, uri, port, database
        else:
            print("Creating credentials config file\n")
            create_creds()
    else:
        print("Attempting to create .config directory in " + homedirectory)
        os.mkdir(homedirectory + "/.config")
        print("Successfully created " + homedirectory + " /.config")
        get_db_config()


def get_emails():
    config = ConfigParser()
    config.read(homedirectory + "/.config/shadowReports.ini")
    send_from = config.get('Email', 'send_from')
    send_to = config.get('Email', 'send_to')
    return send_from, send_to

def get_directories():
    config = ConfigParser()
    config.read(homedirectory + "/.config/shadowReports.ini")
    reports_dir = config.get('Directory', 'reports_dir')
    backup_dir = config.get('Directory', 'backup_dir')
    return reports_dir, backup_dir

