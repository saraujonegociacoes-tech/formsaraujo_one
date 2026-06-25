#!/usr/bin/env sh
# ============================================================
# Gera config.js a partir das variaveis de ambiente.
# Usado pelo Cloudflare Pages no momento do build.
#
# Configure no painel: Cloudflare Pages -> Settings ->
# Variables and Secrets:
#   SUPABASE_URL        = https://SEU-PROJETO.supabase.co
#   SUPABASE_ANON_KEY   = sua anon/public key
# ============================================================
set -e

if [ -z "$SUPABASE_URL" ] || [ -z "$SUPABASE_ANON_KEY" ]; then
  echo "ERRO: defina SUPABASE_URL e SUPABASE_ANON_KEY nas variaveis de ambiente do Pages." >&2
  exit 1
fi

cat > config.js <<EOF
window.SUPABASE_URL = '$SUPABASE_URL';
window.SUPABASE_ANON_KEY = '$SUPABASE_ANON_KEY';
EOF

echo "config.js gerado com sucesso."
