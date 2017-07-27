# ProReports in docker

This is dockerized version of ProReports.

# What is ProReports?

ProReports - is a computer system designed to generate reports in popular office formats - PDF, XLS, RTF, HTML, TXT, XML, CSV, PNG, GIF. 
These reports are generated based on the definition in the internal database system. ProReports supports jrxml (JasperReport) format. 
This type of report templates can be prepared in external editor, such as iReport. Also user can prepare report in internal format of 
ProReports (simple Visual Programming Language mixed with PHP and JAVA). This give him very high flexibility because in this format there
are almost no limits and this is the true power of this simple system.To the system we can attach own plug-ins written in PHP or JAVA.

## Usage
You can run the default proreports command simply:

```
docker run -itd -p 8080:8080 --name proreports gemail/docker-proreports
```
