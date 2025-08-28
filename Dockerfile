# Use Node.js
FROM node:20-alpine

# Set working dir
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy all files
COPY . .

# Generate Prisma client
RUN npx prisma generate

# Build app
RUN npm run build

# Expose port
EXPOSE 3000

# Run migrations automatically, then start
CMD npx prisma migrate deploy && npm run start
