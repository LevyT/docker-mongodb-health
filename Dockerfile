FROM mongo:3.6
RUN echo " \
if mongo --quiet \"127.0.0.1/test\" --eval 'quit(db.runCommand({ ping: 1 }).ok ? 0 : 2)'; then \
	exit 0; \
fi; \
exit 1 \
" > /usr/local/bin/mongo-healthcheck \
&& chmod +x /usr/local/bin/mongo-healthcheck
EXPOSE 27017
HEALTHCHECK --start-period=30s CMD /bin/bash mongo-healthcheck
