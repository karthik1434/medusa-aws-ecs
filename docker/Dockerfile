FROM node:18
WORKDIR /app
RUN npm install -g @medusajs/medusa-cli
COPY . .
RUN npm install
CMD ["medusa", "start"]
