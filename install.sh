#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

clear

echo -e "${CYAN}==========================================${NC}"
echo -e "${GREEN}        INSTALLING AFTAB SHEIKH TOOL          ${NC}"
echo -e "${CYAN}==========================================${NC}"
echo ""

# Check if 'madking' file exists
if [ ! -f "madking" ]; then
  echo -e "${RED}[✘] Error: 'madking' file not found in current directory!${NC}"
  exit 1
fi

echo -e "${YELLOW}[*] Setting permissions...${NC}"
sleep 1
chmod +x madking

echo -e "${YELLOW}[*] Moving to system bin...${NC}"
sleep 1

if [ -d "$PREFIX/bin" ]; then
  mv -f madking $PREFIX/bin/
  INSTALL_PATH="$PREFIX/bin"
elif [ -d "/usr/local/bin" ]; then
  mv -f madking /usr/local/bin/
  INSTALL_PATH="/usr/local/bin"
else
  echo -e "${RED}[✘] Error: Installation path not found!${NC}"
  exit 1
fi

echo -e "${GREEN}[✔] Success: Moved to $INSTALL_PATH${NC}"
echo ""
echo -e "${CYAN}------------------------------------------${NC}"
echo -e "${GREEN}      INSTALLATION COMPLETE BITXXH ❤️✅           ${NC}"
echo -e "${CYAN}------------------------------------------${NC}"
echo -e "${YELLOW}Now you can run the tool by Jatiin:${NC}"
echo -e "${BLUE}>> madking${NC}"
echo ""
