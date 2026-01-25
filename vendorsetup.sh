#!/bin/bash

export OF_DISABLE_OTA_MENU=1
export FOX_AB_DEVICE=1
export FOX_VIRTUAL_AB_DEVICE=1
export OF_DEFAULT_KEYMASTER_VERSION=4.1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_MAINTAINER="Andreii_0514"
export FOX_VARIANT="R11.2-A12_andreii0514"
export OF_FLASHLIGHT_ENABLE=0

export BUILD_USERNAME=XTENSEI_Andreii0514
export BUILD_HOSTNAME=At-Your-Service

export FOX_USE_BASH_SHELL=1
export FOX_USE_NANO_EDITOR=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_USE_XZ_UTILS=1
export FOX_ASH_IS_BASH=1
export OF_ENABLE_LPTOOLS=1
export FOX_DELETE_MAGISK_ADDON=1
export FOX_DELETE_AROMAFM=1
export FOX_ENABLE_APP_MANAGER=1
export OF_SUPPORT_VBMETA_AVB2_PATCHING=1

export FOX_USE_DATA_RECOVERY_FOR_SETTINGS=1

export OF_LOOP_DEVICE_ERRORS_TO_LOG=1

export OF_USE_LZ4_COMPRESSION=true

export OF_SCREEN_H=2400
export OF_STATUS_H=95
export OF_STATUS_INDENT_LEFT=48
export OF_STATUS_INDENT_RIGHT=48
export OF_ALLOW_DISABLE_NAVBAR=0
export OF_CLOCK_POS=1

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_MAXSIZE="5G"
export CCACHE_DIR=".ccache"

if [ ! -d ${CCACHE_DIR} ]; then
  mkdir $CCACHE_DIR
fi

export LC_ALL="C"

# Clone to fix build on minimal manifest
git clone https://android.googlesource.com/platform/external/gflags/ -b android-12.1.0_r4 external/gflags

# Patches
RET=0
cd bootable/recovery
git apply ../../device/transsion/mt6789-common/patches/0001-Change-haptics-activation-file-path.patch > /dev/null 2>&1 || RET=$?
cd ../../
if [ $RET -ne 0 ];then
    echo "ERROR: Patch is not applied! Maybe it's already patched?"
else
    echo "OK: All patched"
fi

echo "Andriana has touched your build"

# --- COLORS ---
RED='\033[38;5;196m'
GRAY='\033[38;5;244m'
DARK='\033[38;5;235m'
CYAN='\033[38;5;45m'
WHITE='\033[38;5;255m'
NC='\033[0m'

clear

# --- HEADER ---
echo -e "${RED}██████╗ ██████╗  █████╗ ██╗   ██╗██████╗  █████╗ ██╗   ██╗███████╗███╗   ██╗${NC}"
echo -e "${RED}██╔════╝ ██╔══██╗██╔══██╗╚██╗ ██╔╝██╔══██╗██╔══██╗██║   ██║██╔════╝████╗  ██║${NC}"
echo -e "${WHITE}██║  ███╗██████╔╝███████║ ╚████╔╝ ██████╔╝███████║██║   ██║█████╗  ██╔██╗ ██║${NC}"
echo -e "${GRAY}██║   ██║██╔══██╗██╔══██║  ╚██╔╝  ██╔══██╗██╔══██║╚██╗ ██╔╝██╔══╝  ██║╚██╗██║${NC}"
echo -e "${GRAY}╚██████╔╝██║  ██║██║  ██║   ██║   ██║  ██║██║  ██║ ╚████╔╝ ███████╗██║ ╚████║${NC}"
echo -e "${GRAY} ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝${NC}"

echo -e "${GRAY}─────────────────────────────────────────────────────────────────────────────${NC}"

# --- SYSTEM STATS (Dynamic) ---
CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM_USED=$(free -m | awk '/Mem:/ { print $3 }')
MEM_TOTAL=$(free -m | awk '/Mem:/ { print $2 }')

echo -e "  ${RED}●${NC} ${WHITE}OPERATOR:${NC} ${GRAY}XTENSEI${NC}        ${RED}●${NC} ${WHITE}CPU LOAD:${NC} ${GRAY}${CPU_LOAD}%${NC}"
echo -e "  ${RED}●${NC} ${WHITE}TARGET:${NC}   ${GRAY}INFINIX-X6881${NC}      ${RED}●${NC} ${WHITE}MEMORY:${NC}   ${GRAY}${MEM_USED}MB / ${MEM_TOTAL}MB${NC}"
echo -e "  ${RED}●${NC} ${WHITE}BRANCH:${NC}   ${GRAY}pbrp-12.1${NC}      ${RED}●${NC} ${WHITE}STATUS:${NC}   ${CYAN}DEVELOPMENT${NC}"

echo -e "${GRAY}─────────────────────────────────────────────────────────────────────────────${NC}"

# --- CLEAN TASK LIST ---
echo -e "  ${WHITE}CURRENT OBJECTIVES:${NC}"
echo -e "  ${GRAY}├─${NC} [${RED}✓${NC}] ${GRAY}BoardConfig.mk Sync${NC}"
echo -e "  ${GRAY}├─${NC} [${RED}✓${NC}] ${GRAY}Transshit Merging${NC}"
echo -e "  ${GRAY}└─${NC} [${CYAN}●${NC}] ${WHITE}Waiting for Recovery Build...${NC}"
echo ""
echo ""
echo -e "\e[1;35m▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓\e[0m"
echo -e "\e[1;33m▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ #GRAYRAVENSTEAM ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒\e[0m"
echo -e "\e[1;35m▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓\e[0m"
echo ""
echo -e "\e[1;91m🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥\e[0m"
echo -e "\e[1;93m✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨   \e[1;97mWELCOME TO #GRAYRAVENSTEAM   \e[1;93m✨✨✨✨✨✨✨✨✨✨✨✨✨✨✨\e[0m"
echo -e "\e[1;91m🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥\e[0m"
echo ""
echo -e "\e[1;32m╔═════════════════════════════════════════════════════════════════════════════════════════════════════════\e[0m"
echo -e "\e[1;32m║\e[0m  \e[1;96m                    ROZEN DOES NOT REPRESENT ME                                           \e[1;32m║\e[0m"
echo -e "\e[1;32m╚═════════════════════════════════════════════════════════════════════════════════════════════════════════\e[0m"
echo ""
echo -e "\e[1;34m─────────────────────────────────────────────────────────────────────────────────────────────────────────\e[0m"
echo -e "\e[1;97m   📦 Repository: https://github.com/XTENSEI/twrp_device_tecno_LI6"
echo -e "\e[1;97m   👥 Team: #GRAYRAVENSTEAM and ShadowBytePrjkt "
echo -e "\e[1;97m   🎯 Branch: pbrp-12.1"
echo -e "\e[1;97m   💻 Purpose: Custom Recovery Development"
echo -e "\e[1;97m   🚀 Status: Active Development"
echo -e "\e[1;34m─────────────────────────────────────────────────────────────────────────────────────────────────────────\e[0m"
echo ""
echo -e "\e[1;33m★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★\e[0m"
echo -e "\e[1;97m                       WELCOME TO THE OFFICIAL #GRAYRAVENSTEAM REPOSITORY                       \e[1;33m★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★ ★\e[0m"
echo ""
echo -e "\e[1;92m✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓\e[0m"
echo -e "\e[1;94m✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓\e[0m"
echo -e "\e[1;96m✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓\e[0m"
echo -e "\e[1;97m                              #GRAYRAVENSTEAM SUCCESSFULLY DISPLAYED                              \e[0m"
echo -e "\e[1;96m✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓\e[0m"
echo -e "\e[1;94m✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓\e[0m"
echo -e "\e[1;92m✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓✓\e[0m"
echo ""
echo -e "\e[1;42;97m                          THANK YOU FOR VISITING #GRAYRAVENSTEAM - HAPPY CODING!                          \e[0m"
echo -e "\e[1;44;97m                       Code with Passion | Build with Purpose | Innovate with Excellence                       \e[0m"
echo ""
