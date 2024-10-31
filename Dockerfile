FROM node:20

RUN apt-get update && apt-get install -y procps

# Install pnpm
RUN npm install -g pnpm

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json pnpm-lock.yaml ./

# Install dependencies
RUN pnpm install

# Copy the rest of the application
COPY . .

# Create volume mount points
VOLUME ["/app/data"]

# Expose the port the app runs on
EXPOSE 3010

# Set environment variables
ENV PLUGIN_DIR=/app/server/plugins

# Start the application using hldk.sh
CMD ["./hldk.sh"]