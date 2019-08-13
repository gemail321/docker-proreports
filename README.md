# ProReports in Docker

This is dockerized version of ProReports.

# What is ProReports?

This is simple reporting system  designed to generate reports in popular office formats - PDF, XLS, RTF, HTML, TXT, XML, CSV, PNG, GIF. 

# Features

* multiple SQL queries in one report,
* multiple Datasources in one report,
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

if you want to add own JDBC drivers to container run command: 

```
docker run -itd -p 8080:8080 -v /dir_with_drivers:/libjar --name proreports gemail/docker-proreports
```
# List of environment variables

* ENV_REPO_LIBJAR (default: libjar) -  Directory with own java library or jdbc drivers
* ENV_REPO_JETTY default:jetty.xml) - Configuration file for databases as JNDI and for server JETTY (used together with --config)
* ENV_REPO_XML (default:repo.xml) - Configuration file for ProReports server (used together with --config)
* ENV_REPO_VER (default:version.php) - Configuration file for web application ProReports (used together with --config)
* ENV_KRB5_REALM (default:xxx) - Configuration fo KERBEROS authentication
* ENV_KRB5_KDC (default:-xxx) - Configuration fo KERBEROS authentication
* ENV_MAIL_DBG (default:false) - Debug for email sending
* ENV_JMX_PORT (default:6969) - Port setting for JMX
* ENV_MS_MEMORY (default:128M) - Setting parametr -Xms for java
* ENV_MX_MEMORY default:1024M) - Setting parametr -Xmx for java

# Access to ProReports 

Run www browser with url: [http://127.0.0.1:8080/rep](http://127.0.0.1:8080/rep) and log on:

```
Login:    admin
Password: admin
```

# Related links

* [Official repository for ProReports](https://sourceforge.net/projects/proreports/?source=navbar)
* [Wiki help for ProReports](http://www.gemail.punkt.pl/pmwiki_en/)
