# lappsgrid/vassar
#
# This image extends the tomcat7 image and adds the Lapps services running
# on the Vassar node.

FROM lappsgrid/tomcat7:1.0.0

ENV TERM=xterm

USER root
ADD ./packages/MASC-3.0.0.tgz /var/corpora/MASC-3.0.0
ADD ./packages/MascDataSource_2.2.0.tgz /var/lib/tomcat7/webapps

ADD ./startup.sh /usr/bin/startup
ADD ./shutdown.sh /usr/bin/shutdown
ADD ./tail-log.sh /usr/bin/taillog
ADD ./waitforlog.sh /usr/bin/waitforlog
ADD ./waitforstart.sh /usr/bin/waitforstart
ADD ./setenv.sh /usr/share/tomcat7/bin/setenv.sh

RUN 	chmod ug+x /usr/bin/waitforstart 

RUN chmod ug+x /usr/bin/taillog && \
	chmod ug+x /usr/bin/shutdown && \
	chmod ug+x /usr/bin/waitforlog 
	
CMD ["/usr/bin/startup"]
