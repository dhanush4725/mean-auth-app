<<<<<<< HEAD
# mean-auth-app
=======
# MEAN Auth App — Setup Guide

## 1. Backend

```bash
cd backend
npm install
npm run dev          # starts on http://localhost:5000
```

Make sure MongoDB is running locally (`mongod`), or edit `.env` and set
`MONGO_URI` to a MongoDB Atlas connection string instead.

## 2. Frontend

From the `mean-auth-app` root folder (where this README lives), run:

```bash
bash setup-frontend.sh
```

This will:
- Delete any broken/partial `frontend` folder
- Generate a fresh Angular project with `npx @angular/cli new`
- Copy all the pre-built component/service files from `frontend-src/`
  into the right places inside `frontend/src/app/`

When the Angular CLI prompts:
- **"Enable Server-Side Rendering (SSR)...?"** → answer **No**
- **"Which AI tools..."** → **None** is fine

Then:

```bash
cd frontend
npm install
npx ng serve          # starts on http://localhost:4200
```

## 3. Try it out

1. Go to `http://localhost:4200` → redirects to `/login`
2. Click "Register", create an account
3. Log in → redirected to the protected `/dashboard`
4. Click "Logout" → sent back to `/login`, and `/dashboard` is
   blocked again until you log in (thanks to `authGuard`)

## Notes on avoiding the permission errors you hit earlier

- Never run `npm install -g` with `sudo` — it writes root-owned files
  into your npm cache that cause permission errors later.
- This setup uses `npx @angular/cli` instead of a global Angular CLI
  install, so it never touches `/usr/lib/node_modules` at all.
- If you want `ng` available directly as a command in future projects,
  set npm's global prefix to your home directory once:
  ```bash
  mkdir ~/.npm-global
  npm config set prefix '~/.npm-global'
  echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.bashrc
  source ~/.bashrc
  npm install -g @angular/cli
  ```

## Folder reference

```
mean-auth-app/
├── backend/              # Express + MongoDB + JWT API — ready to run as-is
├── frontend-src/         # Pre-built Angular component/service source files
├── setup-frontend.sh     # Scaffolds Angular + copies frontend-src into place
└── README.md
```
>>>>>>> a44d63c (initial commit)
