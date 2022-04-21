FROM node:14
# alternatively you can use FROM strapi/base:latest

# Environment variables
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
ARG PUBLIC_URL=http://api.example.com:1337
ENV PUBLIC_URL=${PUBLIC_URL}

# Set up working directory
WORKDIR /app

COPY ./package.json ./
COPY ./yarn.lock ./

# Install dependencies, but not generate a yarn.lock file and fail if an update is needed
RUN yarn config set network-timeout 600000 -g
RUN yarn install --frozen-lockfile

# Copy strapi project files
COPY . .

# Build admin panel
RUN yarn build

# Run on port 1337
EXPOSE 1337

# Start strapi server
CMD ["yarn", "start"]
