#!/bin/bash

# Simulación de ejecución de pipeline
# Este script representa lo que un sistema CI ejecutará automáticamente.
# Aún se ejecuta manualmente en esta fase del laboratorio.

echo "=== PIPELINE START ==="

echo "1. Verificando repositorio..."
git status

echo "2. Confirmando ubicación del proyecto..."
pwd

echo "3. Listando estructura del proyecto..."
ls

echo "=== PIPELINE END ==="
