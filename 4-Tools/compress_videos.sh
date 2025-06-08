#!/bin/bash

# Script para comprimir todos los archivos MP4
cd /home/lmoreno/Proyectos/Automata

echo "Buscando archivos MP4..."

# Usar un array para evitar problemas con pipes y subshells
# Excluir archivos ya comprimidos (*_compressed.mp4) y de prueba (*_test.mp4)
mapfile -t mp4_files < <(find . -name "*.mp4" ! -name "*_compressed.mp4" ! -name "*_test.mp4")

for file in "${mp4_files[@]}"; do
    # Obtener el tamaño del archivo en MB
    size_mb=$(du -m "$file" | cut -f1)

    echo "Archivo: $file - Tamaño: ${size_mb}MB"

    # Comprimir todos los archivos MP4, independientemente del tamaño
    echo "  -> Comprimiendo archivo..."

    # Crear nombre del archivo temporal
    temp_file="${file%.mp4}_compressed.mp4"

    # Comprimir con ffmpeg - configuración optimizada (CRF 27)
    #   -crf 27: Factor de calidad optimizado (mejor balance calidad/tamaño)
    #   -preset slower: Mejor compresión
    #   -r 25: Reducir fps de 30 a 25
    # Audio: configuración específica para reducir tamaño
    #   -c:a aac: Codec AAC
    #   -b:a 64k: Bitrate de audio 64k (suficiente para voz)
    #   -ar 22050: Sample rate 22.05kHz (la mitad del original)
    #   -ac 1: Mono (si es principalmente voz)
    #   -nostdin: No leer desde stdin para evitar prompts interactivos
    #   -hide_banner: Ocultar banner de ffmpeg
    #   -loglevel warning: Mostrar warnings y errores
    #   -stats: Mostrar estadísticas de progreso
    echo "    Ejecutando: ffmpeg para $file"
    ffmpeg -nostdin -hide_banner -loglevel warning -stats -i "$file" -c:v libx264 -crf 27 -preset slower -r 25 -c:a aac -b:a 64k -ar 22050 -ac 1 "$temp_file" -y

    # Capturar código de salida
    ffmpeg_exit_code=$?

    if [ $ffmpeg_exit_code -eq 0 ]; then
        # Obtener el nuevo tamaño
        new_size_mb=$(du -m "$temp_file" | cut -f1)
        reduction_percent=$(echo "scale=1; ($size_mb - $new_size_mb) * 100 / $size_mb" | bc)
        echo "  -> Compresión exitosa: ${size_mb}MB -> ${new_size_mb}MB (${reduction_percent}% reducción)"
        echo "  -> Archivo comprimido guardado como: $temp_file"
        echo "  -> Por favor, verifica la calidad antes de reemplazar el original"

        # COMENTADO: Reemplazar el archivo original con el comprimido
        # mv "$temp_file" "$file"
        # echo "  -> Archivo reemplazado"
    else
        echo "  -> Error en la compresión (código: $ffmpeg_exit_code)"
        rm -f "$temp_file"
    fi
    echo ""
done

echo "Proceso completado."
echo ""
echo "RESUMEN:"
echo "- Se han comprimido todos los archivos MP4 encontrados"
echo "- Los archivos originales se mantienen intactos"
echo "- Los archivos comprimidos tienen sufijo '_compressed.mp4'"
echo ""
echo "SIGUIENTE PASO:"
echo "1. Revisa la calidad de los archivos comprimidos (*_compressed.mp4)"
echo "2. Si estás satisfecho con la calidad, ejecuta el siguiente comando para reemplazar:"
echo "   find . -name '*_compressed.mp4' | while read f; do mv \"\$f\" \"\${f%_compressed.mp4}.mp4\"; done"
echo "3. O elimina los archivos comprimidos si no estás satisfecho:"
echo "   find . -name '*_compressed.mp4' -delete"
