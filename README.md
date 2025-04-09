# Next.js 15 Startup Template

This is a [Next.js 15](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

## Table of Contents
- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Docker Setup](#docker-setup)
- [Project Structure](#project-structure)
- [Learn More](#learn-more)
- [Deploy on Vercel](#deploy-on-vercel)

## Overview

This is a **Next.js 15 modular starter template** pre-configured with:
- **TypeScript**
- **TailwindCSS**
- **PostCSS**
- **Docker**
- **PM2**

Note: This template does **not** include Prisma or additional dependencies—it's meant to be a minimal starting point.

## Prerequisites
- Node.js >= 16.x
- npm or yarn
- Docker (optional for containerized setup)

## Getting Started

First, install dependencies:

```bash
npm install
# or
yarn install
```

Then, run the development server:

```bash
npm run dev
# or
yarn dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser to see the running app.

### Editing & Development
- You can start modifying `src/app/page.tsx` to see real-time changes.
- [API routes](https://nextjs.org/docs/api-routes/introduction) are available under `src/app/api/*`. An example API endpoint is located in `src/app/api/hello/route.ts`.

## Docker Setup

This project includes a **Dockerized development and production environment** using **Docker**.

### Docker Files Overview

- `Dockerfile` – Defines the Next.js build, development, and production environments.
- `.dockerignore` – Specifies files and directories to exclude from the build context.

### Building and Running the Container

#### Development Mode
For a **development-ready** container with live reloading:

1. Build the image:
   ```bash
   docker build -t nextjs-app --target dev .
   ```
2. Run the container:
   ```bash
   docker run -p 3000:3000 nextjs-app
   ```

#### Production Mode
For a **production-ready** container:

1. Build the optimized production image:
   ```bash
   docker build -t nextjs-app --target production .
   ```
2. Run the container:
   ```bash
   docker run -p 3000:3000 nextjs-app
   ```

## PM2 Configuration

This project includes a **PM2 configuration file** for managing your application in production.

### PM2 Configuration File

The `pm2.config.js` file defines the PM2 process configuration:

```javascript
// filepath: pm2.config.js
module.exports = {
  apps: [
    {
      name: "nextjs-app",
        script: "node_modules/next/dist/bin/next",
      args: "start",
      env: {
        NODE_ENV: "production",
      },
    },
  ],
};
```

### Using PM2

1. Install PM2 globally if you haven't already:

   ```bash
   npm install -g pm2
   ```

2. Start the application using PM2:

   ```bash
   pm2 start pm2.config.js
   ```

3. Check the status of your application:

   ```bash
   pm2 status
   ```

4. View application logs:

   ```bash
   pm2 logs
   ```

5. Stop the application:

   ```bash
   pm2 stop nextjs-app
   ```

6. Restart the application:

   ```bash
   pm2 restart nextjs-app
   ```

For more information on PM2, visit the [PM2 Documentation](https://pm2.keymetrics.io/).

## Project Structure
```markdown
./
├── db/
│   └── dumps/
├── public/
│   ├── favicon.ico
│   ├── file.svg
│   ├── globe.svg
│   ├── next.svg
│   ├── vercel.svg
│   └── window.svg
├── src/
│   ├── app/
│   │   ├── api/
│   │   │   └── hello/
│   │   │       └── route.ts
│   │   ├── my-module/
│   │   │   ├── layout.tsx
│   │   │   └── page.tsx
│   │   ├── layout.tsx
│   │   └── page.tsx
│   ├── modules/
│   │   └── my-module/
│   │       ├── components/
│   │       │   ├── common/
│   │       │   ├── layout/
│   │       │   └── my-module/
│   │       │       └── TestComponent.tsx
│   │       ├── constants/
│   │       ├── hooks/
│   │       ├── lib/
│   │       ├── services/
│   │       ├── styles/
│   │       ├── types/
│   │       └── utils/
│   └── shared/
│       ├── components/
│       │   ├── common/
│       │   ├── layout/
│       │   └── my-module/
│       ├── constants/
│       ├── hooks/
│       ├── lib/
│       ├── services/
│       ├── styles/
│       │   └── globals.css
│       ├── types/
│       └── utils/
├── .dockerignore
├── .gitignore
├── Dockerfile
├── README.md
├── eslint.config.mjs
├── next.config.ts
├── package-lock.json
├── package.json
├── pm2.config.js
├── postcss.config.mjs
└── tsconfig.json

34 directories, 24 files
```

## Learn More

To dive deeper into Next.js, check out:

- [Next.js Documentation](https://nextjs.org/docs) – Learn about features and API.
- [Next.js Interactive Tutorial](https://nextjs.org/learn) – Hands-on learning experience.
- [Next.js GitHub Repository](https://github.com/vercel/next.js) – Contribute or explore.

## Deploy on Vercel

The easiest way to deploy your Next.js app is via [Vercel](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme), the creators of Next.js.

For detailed deployment steps, visit the official [Next.js deployment docs](https://nextjs.org/docs/deployment).