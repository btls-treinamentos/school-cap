FROM node:14.18.1

WORKDIR /usr/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
#COPY .npmrc .npmrc

#RUN npm install --arch=x64 --platform=linux 
#RUN pip install hdbcli
RUN npm install

COPY . .
#adjust sqlite binaries 
#RUN npm uninstall sqlite3 && npm install sqlite3 --arch=x64 --platform=linux 

RUN npm run build && npm run deploy

EXPOSE 4004
CMD ["npm","run","start-local"]