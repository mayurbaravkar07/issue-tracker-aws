# Use official Node.js image as base
FROM node:20.10-alpine3.18


# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available) to /app
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

ARG DATABASE_URL
ENV DATABASE_URL=$DATABASE_URL

RUN npx prisma generate
# Build the Next.js application
RUN npm run build



# Command to run the Next.js application
CMD ["npm", "start"]
