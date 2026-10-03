#!/bin/bash

DIR_ORIGIN=$(pwd); ISO_PATH="${DIR_ORIGIN}/Windows.iso"
LABEL="Windows Custom Iso"

echo "Initiating..."

xorriso -as mkisofs \
  -iso-level 4 \
  -J -joliet-long \
  -V "$LABEL" \
  -e efi/microsoft/boot/efisys.bin \
  -no-emul-boot \
  -c boot.catalog \
  -o "$ISO_PATH" \
  "$DIR_ORIGIN"

if [ $? -eq 0 ]; then
    echo "Successfully created $ISO_PATH."
else
    echo "ERROR. Failed to creat Windows ISO."
fi
