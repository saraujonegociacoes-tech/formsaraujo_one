-- ============================================================
-- Tabela de leads da landing page "Análise Segura"
-- Rode isto no Supabase: Dashboard -> SQL Editor -> New query
-- ============================================================

create table if not exists public.leads (
  id          uuid        primary key default gen_random_uuid(),
  created_at  timestamptz not null    default now(),
  nome        text        not null,
  telefone    text        not null
);

-- Habilita Row Level Security (sem isso, ninguém acessa nada)
alter table public.leads enable row level security;

-- Permite que o público (anon key, usada no navegador) APENAS insira.
-- Não permite ler/editar/excluir — os leads ficam protegidos.
-- A leitura você faz pelo painel do Supabase ou com a service_role key.
create policy "leads_insert_anon"
  on public.leads
  for insert
  to anon
  with check (true);
