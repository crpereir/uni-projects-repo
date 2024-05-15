FROM node:alpine

USER root

ENV HOME /home/node

RUN apk -U upgrade && \
	mkdir ${HOME}/app && \
	chown -R node ${HOME}

WORKDIR ${HOME}/app

COPY src/package.json ${HOME}/app/package.json

RUN npm install

COPY src/files/* ${HOME}/app/files/

COPY src/tvsapp.js ${HOME}/app/tvsapp.js
	
ENV NODE_PORT 4007
EXPOSE $NODE_PORT

USER node
CMD ["node", "tvsapp.js"]
