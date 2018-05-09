[![Updates](https://pyup.io/repos/github/5A4B48/Shadow-Report-Aggregator/shield.svg)](https://pyup.io/repos/github/5A4B48/Shadow-Report-Aggregator/)
[![Python 3](https://pyup.io/repos/github/5A4B48/Shadow-Report-Aggregator/python-3-shield.svg)](https://pyup.io/repos/github/5A4B48/Shadow-Report-Aggregator/)

# Shadow-Report-Aggregator
A python project to aggregate shadowserver reports and store them into a server and send out a daily report of their aggregations.

## Installation
Use pip to install requirements using the requirements.txt file as follows 

```
pip install -r /path/to/requirements.txt
```

## Configuration

The first time the script is run it will walk you through the creation of a configuration file if it does not exist. It creates a configuration file at ~/.config of the user it is run as entitiled shadowreports.ini. You can manually create the file as follows 
```
[Database]
username = 
password = 
uri = 
port = 
database = 

[Email]
send_from = 
send_to = 

[Directory]
reports_dir = 
backup_dir = 
```
With the Database information being self explanatory. The send_from email is the email mailbox you will be scraping and sending emails from (this is done over oauth). Directory contains two fields the report directory where it will download reports and parse them and the backup_dir where it will backup the files that are created. 

## TODO 
Talk about usage etc. 
