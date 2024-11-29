# Use Node.js LTS version
FROM node:14

# Set the working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the entire project
COPY . .

# Run tests by default
CMD ["npm", "test"]
