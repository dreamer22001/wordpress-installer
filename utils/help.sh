#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

printf "${BLUE} Este script tem a intenção de automatizar a instalação do WordPress.\n"
printf "${RED} É necessário ter o arquivo de configuração.\n"
printf "${BLUE} Os argumentos possiveis são:\n${NC}"
printf " 1. ${PURPLE} bash wp-installer.sh wp-cli ${NC} para instalar apenas o WordPress cli\n"
printf " 2. ${PURPLE} bash wp-installer.sh wordpress ${NC}para instalar o WordPress\n"
printf " 3. ${PURPLE} bash wp-installer.sh theme${NC} para instalar o tema.\n"
printf " 4. ${PURPLE} bash wp-installer.sh config ${NC}para criar arquivo de configuração.\n"