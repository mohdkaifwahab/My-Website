FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy app source
COPY . ./

# Build (uncomment if your app requires a build step)
# RUN npm run build

RUN npm i


# Expose default port (change if your app uses a different one)
EXPOSE 5173

# Start the app and bind Vite to all interfaces so the published port is reachable.
CMD ["npm", "run", "start", "--", "--host", "0.0.0.0"]