-- Run in your own Supabase project's SQL editor.
create table if not exists public.user_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  payload jsonb not null default '{}'::jsonb
);
alter table public.user_data enable row level security;
create policy "read own data" on public.user_data for select to authenticated using ((select auth.uid()) = user_id);
create policy "insert own data" on public.user_data for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "update own data" on public.user_data for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
