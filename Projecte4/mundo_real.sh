#!/bin/bash
# -------------------------------------------------------------
# Script: informe_sistema.sh
# Empresa: TecnoServe IT (empresa de manteniment de sistemes)
# Autor: [El teu nom]
# Descripció:
#   Aquest script genera un informe del sistema en format HTML i
#   permet crear una còpia de seguretat del directori /home.
# -------------------------------------------------------------

# === CONFIGURACIÓ ===
DATA=$(date +"%Y-%m-%d %H:%M:%S")
NOM_HOST=$(hostname)
SORTIDA_HTML="/var/www/html/informe_sistema.html"  # ubicació del fitxer HTML
BACKUP_DIR="/backups"
SOURCE_DIR="/home"

# Crear carpeta de backup si no existeix
mkdir -p "$BACKUP_DIR"

# === FUNCIÓ PER GENERAR BACKUP ===
crear_backup() {
    echo "Creant còpia de seguretat de $SOURCE_DIR ..."
    NOM_BACKUP="backup_$(date +%Y%m%d_%H%M%S).tar.gz"
    tar -czf "$BACKUP_DIR/$NOM_BACKUP" "$SOURCE_DIR" 2>/dev/null
    echo "Backup creat: $BACKUP_DIR/$NOM_BACKUP"
}

# === FUNCIÓ PER GENERAR INFORME ===
generar_informe() {
    echo "Generant informe HTML..."

    UPTIME=$(uptime -p)
    MEM_TOTAL=$(free -h | awk '/Mem:/ {print $2}')
    MEM_USADA=$(free -h | awk '/Mem:/ {print $3}')
    DISK_USAT=$(df -h / | awk 'NR==2 {print $3}')
    DISK_LLIURE=$(df -h / | awk 'NR==2 {print $4}')
    USUARIS=$(who | wc -l)
    PROCESSES=$(ps aux | wc -l)

    cat <<EOF > "$SORTIDA_HTML"
<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <title>Informe del sistema - $NOM_HOST</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f4f4; color: #333; margin: 20px; }
        h1 { background-color: #007bff; color: white; padding: 10px; }
        table { border-collapse: collapse; width: 100%; background: white; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #007bff; color: white; }
        .backup { margin-top: 20px; }
        .button { background: #28a745; color: white; padding: 10px; text-decoration: none; border-radius: 5px; }
        .button:hover { background: #218838; }
    </style>
</head>
<body>
    <h1>Informe del Sistema - $NOM_HOST</h1>
    <p><strong>Data:</strong> $DATA</p>

    <table>
        <tr><th>Paràmetre</th><th>Valor</th></tr>
        <tr><td>Uptime</td><td>$UPTIME</td></tr>
        <tr><td>Memòria total</td><td>$MEM_TOTAL</td></tr>
        <tr><td>Memòria usada</td><td>$MEM_USADA</td></tr>
        <tr><td>Disc usat</td><td>$DISK_USAT</td></tr>
        <tr><td>Disc lliure</td><td>$DISK_LLIURE</td></tr>
        <tr><td>Usuaris connectats</td><td>$USUARIS</td></tr>
        <tr><td>Processos actius</td><td>$PROCESSES</td></tr>
    </table>

    <div class="backup">
        <h2>Gestió de Backups</h2>
        <form action="" method="post">
            <a href="?backup=true" class="button">Crear Backup</a>
        </form>
    </div>
</body>
</html>
EOF
    echo "Informe generat a: $SORTIDA_HTML"
}

# === LÒGICA PRINCIPAL ===
if [[ $1 == "--backup" ]]; then
    crear_backup
else
    generar_informe
fi
