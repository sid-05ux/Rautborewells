
create type public.doc_type as enum ('quotation', 'bill');

create table public.documents (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  doc_type public.doc_type not null default 'quotation',
  doc_no text not null,
  doc_date date not null default current_date,
  booking_date date,
  customer_name text not null default '',
  customer_mobile text not null default '',
  advance_amount text not null default '',
  items jsonb not null default '[]'::jsonb,
  terms text not null default '',
  total numeric not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index documents_user_created_idx on public.documents (user_id, created_at desc);

alter table public.documents enable row level security;

create policy "Users select own documents"
  on public.documents for select
  to authenticated
  using (auth.uid() = user_id);

create policy "Users insert own documents"
  on public.documents for insert
  to authenticated
  with check (auth.uid() = user_id);

create policy "Users update own documents"
  on public.documents for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

create policy "Users delete own documents"
  on public.documents for delete
  to authenticated
  using (auth.uid() = user_id);

create or replace function public.touch_updated_at()
returns trigger language plpgsql as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create trigger documents_touch_updated_at
  before update on public.documents
  for each row execute function public.touch_updated_at();
