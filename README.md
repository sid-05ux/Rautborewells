# Raut Borewells And Pumps — Quotation App

A web application for generating professional borewell service quotations and saving them as PDFs.

## Tech Stack
- React 19 + TypeScript
- TanStack Start (SSR framework)
- TanStack Router
- Supabase (auth + database)
- Tailwind CSS v4
- shadcn/ui components
- jsPDF for PDF generation

## Setup

### 1. Install dependencies
```bash
bun install
```

### 2. Configure environment variables
Copy `.env` and fill in your Supabase credentials:
```
VITE_SUPABASE_URL=your_supabase_project_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
```

### 3. Run database migrations
Apply the SQL files in `supabase/migrations/` to your Supabase project via the Supabase dashboard or CLI.

### 4. Start dev server
```bash
bun run dev
```

### 5. Build for production
```bash
bun run build
```
