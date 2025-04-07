#!/bin/bash

# ================================================================================
# Skrypt: kopia.sh
# Copyright (c) 2025 by Lukasz wojcik
# Site:   https://lukaszwojcik.eu
# GitHub: https://github.com/lukaszwojcikdev
#
# Skrypt do tworzenia kopii zapasowej plikow z katalogu DESKTOP
#        do katalogu KOPIA
# ================================================================================

# Ustawienie zmiennych
SOURCE\_DIR="/home/kali/Desktop"      # Katalog zrodlowy
BACKUP\_DIR="/home/kali/KOPIA"        # Katalog docelowy kopii zapasowej
LOG\_FILE="/var/log/kopia.log"        # Plik logu
DATE=$(date +"%Y-%m-%d %H:%M:%S")     # Aktualna data i godzina

# Sprawdzenie, czy katalog docelowy istnieje, jesli nie - tworzymy go
if [ ! -d "$BACKUP\_DIR" ]; then
    mkdir -p "$BACKUP\_DIR"
    echo "$DATE: Utworzono katalog docelowy: $BACKUP\_DIR" >> "$LOG\_FILE"
fi

# Utworzenie kopii zapasowej
rsync -av --delete "$SOURCE\_DIR/" "$BACKUP\_DIR/" >> "$LOG\_FILE" 2>&1

# Logowanie wyniku operacji
if [ $? -eq 0 ]; then
    echo "$DATE: Kopia zapasowa katalogu $SOURCE\_DIR zostala wykonana pomyslnie." >> "$LOG\_FILE"
else
    echo "$DATE: Blad podczas tworzenia kopii zapasowej katalogu $SOURCE\_DIR." >> "$LOG\_FILE"
fi
