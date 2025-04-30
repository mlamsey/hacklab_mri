#!/bin/bash

# Prompt for SUBJECT with PRRxxx validation
while true; do
    read -p "Enter SUBJECT (e.g., PRR001): " SUBJECT
    if [[ "$SUBJECT" =~ ^PRR[0-9]{3}$ ]]; then
        break
    else
        echo "❌ Invalid SUBJECT. Must match pattern PRRxxx (e.g., PRR001)."
    fi
done

# Prompt for SESSION (bl, pt, or pm)
while true; do
    read -p "Enter SESSION (bl, pt, pm): " SESSION
    if [[ "$SESSION" =~ ^(bl|pt|pm)$ ]]; then
        SESSION_UPPER=$(echo "$SESSION" | tr '[:lower:]' '[:upper:]')
        break
    else
        echo "❌ Invalid SESSION. Must be one of: bl, pt, pm."
    fi
done

# Search for the matching DICOM folder under ./DATA
DATA_DIR="$HOME/hackney_data/HACKNEYPARTNER"
if [[ "$SESSION_UPPER" == "BL" ]]; then
    MATCH_PATTERN="^${SUBJECT}(_BL|_[0-9]+)"
else
    MATCH_PATTERN="^${SUBJECT}_${SESSION_UPPER}"
fi

# Find matching folder
DICOM_DIR=$(find "$DATA_DIR" -maxdepth 1 -type d -printf "%f\n" | grep -E "$MATCH_PATTERN" | head -n 1)

# Check if found
if [[ -z "$DICOM_DIR" ]]; then
    echo "❌ No matching DICOM folder found for SUBJECT=$SUBJECT and SESSION=$SESSION in $DATA_DIR"
    return 1 2>/dev/null || exit 1
fi

# Set full path
DICOM_DIR="${DATA_DIR}/${DICOM_DIR}"

# update vars
SESSION="PRR$SESSION"
PROJECT_DIR="$HOME/hackney_share/PARTNER"

# Export variables
export SUBJECT
export SESSION
export SUB_LABEL="sub-$SUBJECT"
export DICOM_DIR
export PROJECT_DIR

# Confirmation
echo ""
echo "✅ Variables set:"
echo "  SUBJECT     = $SUBJECT"
echo "  SESSION     = $SESSION"
echo "  SUB_LABEL   = $SUB_LABEL"
echo "  DICOM_DIR   = $DICOM_DIR"
echo "  PROJECT_DIR = $PROJECT_DIR"


