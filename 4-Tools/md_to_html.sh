#!/bin/bash

# Script para convertir README.md a docs/index.html
# Uso: bash 4-Tools/md_to_html.sh

cd /home/lmoreno/Proyectos/Automata

echo "Convirtiendo README.md a docs/index.html..."

# Verificar que existe la carpeta docs
if [ ! -d "docs" ]; then
    echo "Creando carpeta docs/..."
    mkdir -p docs
fi

# Verificar si pandoc está instalado
if command -v pandoc &> /dev/null; then
    # Usar pandoc para conversión automática
    echo "Generando HTML con pandoc..."
    pandoc README.md -o docs/index.html \
        --css=style.css \
        --standalone \
        --toc \
        --toc-depth=3 \
        --metadata title="🤖 Automata Theory and Theory of Computation"
    echo "✅ Conversión completada usando pandoc."
    echo ""
    echo "📁 Archivo generado: docs/index.html"
    echo "🎨 Usando hoja de estilos: docs/style.css"
    echo "🌐 Para ver el resultado, abre: file://$(pwd)/docs/index.html"
else
    echo "❌ Pandoc no está instalado."
    echo ""
    echo "Para instalar pandoc:"
    echo "  Ubuntu/Debian: sudo apt-get install pandoc"
    echo "  Fedora/RHEL:   sudo dnf install pandoc"
    echo "  Arch Linux:    sudo pacman -S pandoc"
    echo ""
    echo "Después de instalar pandoc, ejecuta este script nuevamente."
    exit 1
fi
