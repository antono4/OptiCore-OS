#!/bin/bash
# ==========================================
# OptiCore OS - Playbook Builder (Linux/macOS)
# ==========================================
# Version: 1.0.0
# Author: OptiCore Team
# Description: Build OptiCore OS Playbook

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║     OptiCore OS - Playbook Builder        ║${NC}"
echo -e "${GREEN}║             Version 1.0.0                 ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════╝${NC}"
echo ""

SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT="$SOURCE/OptiCoreOS"
PASSWORD="opticore"

# Check if zip is available
if ! command -v zip &> /dev/null; then
    echo -e "${RED}[ERROR] zip not found. Please install zip to build the playbook.${NC}"
    exit 1
fi

# Create output directory
echo -e "${YELLOW}[INFO]${NC} Creating output directory..."
rm -rf "$OUTPUT"
mkdir -p "$OUTPUT"

# Copy configuration files
echo -e "${YELLOW}[INFO]${NC} Copying configuration files..."
cp -r "$SOURCE/Configuration" "$OUTPUT/"

# Copy executables
echo -e "${YELLOW}[INFO]${NC} Copying executables..."
cp -r "$SOURCE/Executables" "$OUTPUT/"

# Copy images (if exists)
if [ -d "$SOURCE/Images" ]; then
    cp -r "$SOURCE/Images" "$OUTPUT/"
fi

# Copy playbook.conf
echo -e "${YELLOW}[INFO]${NC} Copying playbook configuration..."
cp "$SOURCE/playbook.conf" "$OUTPUT/"

# Create the playbook archive
echo -e "${YELLOW}[INFO]${NC} Building playbook..."
cd "$SOURCE"
zip -r -P "$PASSWORD" "OptiCoreOS.playbook" "OptiCoreOS/" > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}╔═══════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║        Build Successful!                   ║${NC}"
    echo -e "${GREEN}╚═══════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "Output: $SOURCE/OptiCoreOS.playbook"
    echo -e "Password: $PASSWORD"
    echo ""
    echo -e "${YELLOW}[NOTE]${NC} Use AME Wizard to apply this playbook:"
    echo "  1. Download AME Wizard from https://amelimes.com/"
    echo "  2. Run AME Wizard and load OptiCoreOS.playbook"
    echo "  3. Enter password: opticore"
    echo ""
else
    echo ""
    echo -e "${RED}╔═══════════════════════════════════════════╗${NC}"
    echo -e "${RED}║        Build Failed!                       ║${NC}"
    echo -e "${RED}╚═══════════════════════════════════════════╝${NC}"
    echo ""
fi

# Cleanup
rm -rf "$OUTPUT"