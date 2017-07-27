# ProReports in Docker

This is dockerized version of ProReports.

# What is ProReports?

This is simple reporting system  designed to generate reports in popular office formats - PDF, XLS, RTF, HTML, TXT, XML, CSV, PNG, GIF. 

# Futures

* multiple SQL queries in one report,
* support for temporary tables,
* support for stored procedures (PL/SPL),
* execute not SELECT sql command,
* multilingualism (UTF-8 support) in reports,
* multiplatform (AIX, Linux, Solaris, Windows)
* support reports based on RTF templates,
* support for popular formats (PDF, XLS, RTF, HTML,TXT,XML,CSV, PNG, GIF),
* digitally signed PDF reports,
* support for multiple databases,
* dashboards for managers,
* ability to extend the functionality by adding modules PHP and JAVA,
* access to the reports by the browser WWW,
* internal schedule generation of reports,
* module for automatically send reports (e-mail) with GPG encryption, ZIP compression,
* connection pooling for databases,
* ability to generate reports from the command line (windows and unix),
* possibility of mass generation and processing of reports,
* definable forms for parameters of reports,
* support for permissions to reports,
* data filters to generate reports,
* multithreaded execution of SQL queries.

# Usage
You can run the default proreports command simply:

```
docker run -itd -p 8080:8080 --name proreports gemail/docker-proreports
```
# Access to ProReports 

Run www borwser with url: [http://127.0.0.1:8080/rep](http://127.0.0.1:8080/rep) and log on:

```
Login:    admin
Password: admin
```
# Related links 

* [Official repository for ProReports](https://sourceforge.net/projects/proreports/?source=navbar)
* [Wiki help for ProReports](http://www.gemail.punkt.pl/pmwiki_en/)

