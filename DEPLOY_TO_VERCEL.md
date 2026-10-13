# Deploying Krishna Bhojnalay to Vercel

This guide outlines how to deploy the **Krishna Bhojnalay (PHP & MySQL)** project to **Vercel** with the serverless PHP runtime and cloud database.

---

## Architecture Overview

1. **Serverless PHP Runtime**: Configured in `vercel.json` using `vercel-php@0.9.0`.
2. **Front Controller Router**: Located at `api/index.php`, handling dynamic page routing and static asset delivery.
3. **Dual-Environment Database (`connection/connect.php`)**:
   - **Localhost**: Connects automatically to local XAMPP MySQL (`localhost`, `root`, `onlinefoodphp`).
   - **Vercel**: Connects to your Cloud MySQL database using environment variables (`DB_HOST`, `DB_USER`, `DB_PASSWORD`, `DB_NAME`, `DB_PORT`).

---

## Step 1: Free Cloud MySQL Database Setup

Because Vercel is serverless, you need a cloud-hosted MySQL database. You can get one completely free in 2 minutes:

### Recommended: TiDB Cloud Serverless (100% Free Forever)
1. Sign up for free at [tidbcloud.com](https://tidbcloud.com/).
2. Click **Create Cluster** and choose **Serverless (Free)**.
3. In the cluster dashboard, click **Connect** to get your connection details:
   - **Host** (e.g. `gateway01.ap-southeast-1.prod.aws.tidbcloud.com`)
   - **Port** (e.g. `4000`)
   - **User** (e.g. `xxxxxx.root`)
   - **Password**
   - **Database** (e.g. `test` or create `onlinefoodphp`)
4. Open the SQL Editor / Import tab and import the schema from:
   `DATABASE FILE/onlinefoodphp.sql`

*(Alternative free options: [Aiven for MySQL](https://aiven.io/), [Clever Cloud MySQL](https://www.clever-cloud.com/), or [Railway MySQL](https://railway.app/))*

---

## Step 2: Deploy to Vercel

You can choose either **Option A (GitHub - Recommended)** or **Option B (Vercel CLI)**.

### Option A: Deploy via GitHub (Easiest & Automatic CI/CD)
1. Create a new repository on your GitHub account (e.g., `krishna-bhojnalay`).
2. In your local project terminal, link and push the code:
   ```powershell
   git remote add origin https://github.com/<YOUR_GITHUB_USERNAME>/krishna-bhojnalay.git
   git branch -M main
   git push -u origin main
   ```
3. Go to [vercel.com/new](https://vercel.com/new).
4. Click **Import** next to your `krishna-bhojnalay` repository.
5. In the **Environment Variables** section, add your database credentials:
   - `DB_HOST` = `<your_cloud_mysql_host>`
   - `DB_USER` = `<your_cloud_mysql_user>`
   - `DB_PASSWORD` = `<your_cloud_mysql_password>`
   - `DB_NAME` = `<your_cloud_mysql_database_name>`
   - `DB_PORT` = `3306` (or `4000` for TiDB)
6. Click **Deploy**. Vercel will build and launch your site live!

---

### Option B: Deploy via Vercel CLI

1. Open PowerShell / Terminal in this project directory:
   ```powershell
   cd "c:\Users\soham\Downloads\SE Project\Food_Ordering_System"
   ```
2. Log in to Vercel:
   ```powershell
   npx vercel login
   ```
   *(A browser window will open to confirm your login).*
3. Deploy to production:
   ```powershell
   npx vercel --prod
   ```
4. Follow the interactive prompts:
   - Set up and deploy? **Yes**
   - Link to existing project? **No**
   - Project name? **krishna-bhojnalay**
   - In which directory is your code located? **./**
5. Add your database environment variables:
   ```powershell
   npx vercel env add DB_HOST
   npx vercel env add DB_USER
   npx vercel env add DB_PASSWORD
   npx vercel env add DB_NAME
   npx vercel env add DB_PORT
   ```
6. Redeploy with the updated variables:
   ```powershell
   npx vercel --prod
   ```

---

## Files Configured in This Project

- `vercel.json` - Vercel serverless functions and routing map.
- `api/index.php` - Serverless PHP request dispatcher.
- `api/php.ini` - Serverless PHP configuration (sessions in `/tmp`, upload limits).
- `connection/connect.php` - Dual-mode database connection.
- `.vercelignore` - Excludes large archive files and local caches from deployment.
- `.gitignore` - Excludes build and temporary files from git.
