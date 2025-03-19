#!/bin/bash

# Obtém a versão do projeto
PROJECT_VERSION=$(cat VERSION 2>/dev/null)

# Obtém a versão do repositório remoto
REMOTE_VERSION=$(git ls-remote origin -h refs/heads/main | awk '{print $1}')
LOCAL_VERSION=$(git rev-parse HEAD)

# Exibe as versões atuais
echo "Versão local: $LOCAL_VERSION"
echo "Versão remota: $REMOTE_VERSION"

# Atualiza o repositório se necessário
echo "Atualizando repositório..."
git pull --rebase origin main

# Exibe merges necessários
echo "Merges necessários:" 
git log --merges --oneline -n 5

# Adiciona novos arquivos e faz commit
echo "Adicionando arquivos..."
git add .
echo "Realizando commit..."
git commit -m "Atualização automática do projeto - $(date)"

echo "Enviando para o repositório remoto..."
git push origin main

echo "Processo concluído!"