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

<<<<<<< HEAD
# 10. Start app with migrations
CMD npx prisma migrate deploy && node dist/index.js
=======
# Run migrations automatically, then start
CMD npx prisma migrate deploy && npm run start
>>>>>>> b2664ce (update Dockerfile to run migrations)
