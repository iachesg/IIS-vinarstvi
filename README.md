# IIS

Laravel 10 application for winery management, built with Livewire and Vite.

## Requirements

- PHP 8.1+
- Composer
- Node.js 18+ and npm

## Local Setup

1. Install PHP dependencies:

```bash
composer install
```

2. Install frontend dependencies:

```bash
npm install
```

3. Create your local environment file if it does not exist:

```bash
cp .env.example .env
```

4. Generate the application key:

```bash
php artisan key:generate
```

5. Make sure your database settings in `.env` point to a reachable MySQL server. The example file is already configured for the remote project database; if you want a fully local setup, update the `DB_*` values before running migrations.

6. Run migrations and seeders if needed:

```bash
php artisan migrate --seed
```

## Run The App

Open two terminals in the project root and run:

```bash
php artisan serve
```

```bash
npm run dev
```

Then open the URL shown by Artisan, usually http://127.0.0.1:8000.

## Notes

- Keep `.env` out of version control.
- If the app cannot connect to the database, check the `DB_HOST`, `DB_PORT`, `DB_DATABASE`, `DB_USERNAME`, and `DB_PASSWORD` values in `.env`.
