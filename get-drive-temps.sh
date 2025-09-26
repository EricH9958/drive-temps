#!/usr/bin/env bash

OUTDIR="/opt/Docker/drive-temps"
TMPFILE="$OUTDIR/drive_temps.tmp"
FINAL="$OUTDIR/drive_temps.txt"

{
  echo "Last updated: $(date '+%Y-%m-%d %H:%M:%S')"
  echo ""

  mapfile -t drives < <(
    lsblk -dn -o NAME,TYPE \
      | awk '$2=="disk" {print $1}'
  )

  for d in "${drives[@]}"; do
    dev="/dev/$d"
    [ ! -b "$dev" ] && continue

    if [[ $d == nvme* ]]; then
      # NVMe device temperature read using -d nvme flag
      temp=$(/usr/sbin/smartctl -A "$dev" -d nvme 2>/dev/null | awk '/Temperature Sensor 1:/ {print $(NF-1); exit}')
    else
      # Regular SATA/SCSI device temperature read
      temp=$(/usr/sbin/smartctl -A "$dev" 2>/dev/null | awk '/Temperature_Celsius/ {print $10; exit}')
    fi

    if [[ $temp =~ ^[0-9]+$ ]]; then
      printf '%s: %s°C\n' "$d" "$temp"
    fi
  done
} > "$TMPFILE" && mv "$TMPFILE" "$FINAL"

