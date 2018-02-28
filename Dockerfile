FROM jetty:alpine

USER root
RUN apk update && \
	apk add xmlstarlet && \
	/usr/bin/xmlstarlet ed --subnode "/Configure/New[@id='httpConfig']" --type elem -n Call -v "" $JETTY_HOME/etc/jetty.xml | \
	/usr/bin/xmlstarlet ed --insert "/Configure/New[@id='httpConfig']/Call" --type attr -n "name" -v "addCustomizer" | \
	/usr/bin/xmlstarlet ed --subnode "/Configure/New[@id='httpConfig']/Call" --type elem -n "Arg" -v "" | \
	/usr/bin/xmlstarlet ed --subnode "/Configure/New[@id='httpConfig']/Call/Arg" --type elem -n "New" -v "" | \
	/usr/bin/xmlstarlet ed --insert "/Configure/New[@id='httpConfig']/Call/Arg/New" --type attr -n "class" -v "org.eclipse.jetty.server.ForwardedRequestCustomizer" \
	> $JETTY_HOME/etc/jetty-new.xml && \
	mv $JETTY_HOME/etc/jetty-new.xml $JETTY_HOME/etc/jetty.xml && \
	apk del xmlstarlet 
	
USER jetty
