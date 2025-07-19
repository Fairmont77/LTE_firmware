#!/bin/bash
set -e

echo "🔄 Starting OpenIPC firmware build with Masina..."

# Клонування репозиторіїв
echo "📂 Cloning repositories..."
git clone https://github.com/OpenIPC/firmware.git
git clone -b opt https://github.com/beep-systems/quadrofleet-masina.git

# Збірка Masina клієнта
echo "🔨 Building Masina client..."
cd quadrofleet-masina/client
make clean
make

# Копіювання файлів
echo "📋 Copying Masina files to firmware..."
cd /build
cp -r quadrofleet-masina/client/drop/* firmware/ || echo "⚠️ No files to copy"

# Збірка прошивки
echo "🚀 Building firmware..."
cd firmware
make

echo "✅ Build completed! Check firmware/ directory for results."
ls -la firmware/ | grep -E "\.(bin|img|fw)$" || echo "No firmware files found"
