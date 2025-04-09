# NextJS 15 Dockerfile

# Base
FROM node:22.14.0-alpine AS base
RUN apk add --no-cache g++ make py3-pip libc6-compat

ARG PORT=3001
ENV NEXT_TELEMETRY_DISABLED=1

WORKDIR /app

COPY package.json package-lock.json ./

# Remove comment if using prisma
# COPY prisma ./prisma/



# Build
FROM base AS builder
WORKDIR /app

RUN npm ci
COPY . .

# Remove comment if using prisma
# RUN npx prisma generate
RUN npm run build



# Production
FROM base AS production
WORKDIR /app

ENV NODE_ENV=production
ENV PORT=$PORT
ENV HOSTNAME="0.0.0.0"

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static
COPY --from=builder /app/public ./public

USER nextjs

EXPOSE $PORT

CMD ["node", "server.js"]



# Development
FROM base as dev
ENV NODE_ENV=development

RUN npm install 
COPY . .

EXPOSE $PORT

CMD ["npm", "run", "dev", "--", "-H", "0.0.0.0"]
