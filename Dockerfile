# 1. Use Node.js 20 Alpine as base
FROM node:20-alpine

# 2. Set working directory
WORKDIR /usr/src/app

# 3. Copy package.json and package-lock.json
COPY package*.json ./

# 4. Install dependencies
RUN npm install

# 5. Copy source code
COPY . .

# 6. Compile TypeScript
RUN npx tsc

# 7. Generate Prisma client
RUN npx prisma generate

# 8. Copy views into dist folder
RUN mkdir -p dist/views
RUN cp -r src/views/* dist/views/

# 9. Expose port
EXPOSE 3000

# 10. Start app with migrations
CMD npx prisma migrate deploy && node dist/index.js
