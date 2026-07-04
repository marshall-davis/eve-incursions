FROM node:22-alpine

WORKDIR /app

# Copy workspace manifests
COPY package.json package-lock.json ./
COPY packages/server/package.json ./packages/server/
COPY packages/ws/package.json ./packages/ws/
COPY packages/frontend/package.json ./packages/frontend/

# Install all dependencies (dev deps required at runtime for ts-node/tsx)
RUN npm install

# Copy source
COPY . .

# Build Next.js frontend
RUN npm run build --workspace=frontend

EXPOSE 3000

# CMD is intentionally omitted — each deployment specifies its own start command