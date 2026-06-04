#!/usr/bin/env bash
set -e

echo "Initializing Pocket TTS Streaming Environment..."

# 1. Sicherstellen, dass die Cache-Ordner im Home Assistant Share-Verzeichnis existieren
echo "Setting up cache directories in /share..."
mkdir -p /share/pocket_tts_cache
mkdir -p /share/huggingface_cache

# 2. Den Standard-.cache-Ordner im Container anlegen, falls er noch nicht existiert
mkdir -p /root/.cache

# 3. Symlinks erstellen: Verknüpfe die internen Cache-Pfade mit dem /share-Ordner
# (Die Option -sfn sorgt dafür, dass bestehende Links falls nötig sauber überschrieben werden)
ln -sfn /share/pocket_tts_cache /root/.cache/pocket_tts
ln -sfn /share/huggingface_cache /root/.cache/huggingface

echo "Cache directories linked successfully."

# 4. Den eigentlichen Server starten
python3 /app/wyoming_server.py
