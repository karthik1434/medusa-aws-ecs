FROM node:18

WORKDIR /app

# Install only required global packages
RUN npm install -g @medusajs/medusa-cli@1.3.23

# Copy package files first for caching
COPY src/package*.json ./

# Install project dependencies
RUN npm install --legacy-peer-deps --omit=dev

# Copy application code
COPY src/ .

# Create required directories
RUN mkdir -p ./dist ./uploads

# Directly run the server (bypassing CLI issues)
CMD ["medusa", "start"]