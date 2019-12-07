FROM node:10.15-slim

ARG WORKDIR=$WORKDIR
WORKDIR $WORKDIR

COPY package.json package-lock.json razzle.config.js .razzle.config.js ./
COPY build/ build/
COPY node_modules/ node_modules/
COPY __config__/ __config__/

EXPOSE 3000

CMD ["npm", "run", "start:prod"]
