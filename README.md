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

# Limits

* Annual limit of reports is set to 5 
* The limit can be increased by making a donation to the author on site [Wiki help for ProReports](https://gemail.ogicom.pl/pmwiki_en/)

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

* ENV_JAVA_OPTS - Additional java options
* ENV_REPO_LIBJAR (default: libjar) -  Directory with own java library or jdbc drivers
* ENV_REPO_JETTY default:jetty.xml) - Configuration file for databases as JNDI and for server JETTY (used together with --config)
* ENV_REPO_KEYSTORE default:keystore) - Configuration file  keystore  for server JETTY (used together with --config)
* ENV_REPO_WEBDEF default:webdefault.xml) - Configuration file webdefault.xml for server JETTY (used together with --config)
* ENV_REPO_WEBXML default:web.xml) - Configuration file for databases as JNDI and for server JETTY (used together with --config)
* ENV_REPO_WEBPHP default:php.ini) - Configuration file for PHP for Quercus (used together with --config)
* ENV_REPO_XML (default:repo.xml) - Configuration file for ProReports server (used together with --config)
* ENV_REPO_VER (default:version.php) - Configuration file for web application ProReports (used together with --config)
* ENV_KRB5_REALM (default:xxx) - Configuration for KERBEROS authentication
* ENV_KRB5_KDC (default:-xxx) - Configuration for KERBEROS authentication
* ENV_MAIL_DBG (default:false) - Debug for email sending
* ENV_JMX_PORT (default:6969) - Port setting for JMX
* ENV_MS_MEMORY (default:128M) - Setting parametr -Xms for java
* ENV_MX_MEMORY (default:1024M) - Setting parametr -Xmx for java
* ENV_CMD_BEFORE - Setting command executed before launching ProReports 
* ENV_RSYNC_BASE - Setting path to file with rsync-dir configuration. This meachanism allows you to replicate database files of ProReports to the distributed ETCD (kubernetes cluster) or REDIS database. Thanks to this, the system remembers changes after restarting the container, even without applying persistent volume.

```ini
[MAIN]
description=rsync-dir replicator
storedb=redis
actions=restore,delete,mtime,start
basedir=/usr/ProReports.utf8/BASE/
rootdir=/rsync-base/
rootchunks=/rsync-base-chunks/
chunksize=1048576
patterns=*.log.db,*.data.db,*.lob.db,*.index.db,*.temp.db
ignore_patterns=*.lock.db
mtime_patterns=*.log.db,*.data.db,*.lob.db,*.index.db,*.temp.db
mtime_cycle_time=15
mtime_info=False
case_sensitive=True
[ETCD]
hosts=ADDRESS_IP1[,ADSRESS_IP2,ADDRES_IP3,...] 
ports=2379[,2379,2379,...]
threads=2
ca_cert=/rsync/ca.crt
cert_key=/rsync/server.key
cert_cert=/rsync/server.crt
user=
password=
timeout=2
reconnect_time=5
reconnect_max=3

[REDIS]
hosts=ADDRESS_IP1[,ADDRESS_IP2,ADDRESS_IP3,...]
ports=6379[,6379,6379,...]
db=10
user=
password=
ssl=False
ssl_keyfile=
ssl_certfile=
ssl_ca_certs=
ssl_cert_reqs=
threads=2
reconnect_time=5
reconnect_max=3
socket_timeout=5
socket_keepalive=False
socket_connect_timeout=5
```

If you want to use ETCD in kubernetes cluster you must set parameters:

```ini
ca_cert=/rsync/ca.crt
cert_key=/rsync/server.key
cert_cert=/rsync/server.crt
```

where files ca.crt, server.key, server.crt must be taken from the directory `/etc/kubernetes/pki/etcd`. If you launch ProReports in kubernetes cluster it's good idea to put these files as secret (together with rsync-base.ini).

Example command to start container:
```
docker run -itd -p 8080:8080 -v /opt/rsync-dir/:/rsync  -e ENV_RSYNC_BASE=/rsync/rsync-base.ini --name proreports gemail/docker-proreports
```

* ENV_RSYNC_FILES - Setting path to file with rsync-dir configuration for files uploaded to ProReports. This meachanism allows you to replicate  files uploaded to ProReports to the distributed ETCD (kubernetes cluster) or REDIS database. Thanks to this, the system remembers changes after restarting the container, even without applying persistent volume. Configuration file is similar to file for `ENV_RSYNC_BASE` variable. You must change only parameters:

```ini
basedir=/usr/ProReports.utf8/webapps-plus/rep/files/
rootdir=/rsync-files/
rootchunks=/rsync-files-chunks/
patterns=*.*
ignore_patterns=*.---
mtime_patterns=*.*
```

* ENV_RSYNC_MAX_LOOP (default: 20) - maximum number of waiting loops for database and file synchronization. Time=ENV_RSYNC_MAX_LOOP*5 seconds.   

# Access to ProReports 

Run www browser with url: [http://127.0.0.1:8080/rep](http://127.0.0.1:8080/rep) and log on:

```
Login:    admin
Password: admin
```

# Related links

* [Official repository for ProReports](https://sourceforge.net/projects/proreports/?source=navbar)
* [Wiki help for ProReports](https://gemail.ogicom.pl/pmwiki_en/)
