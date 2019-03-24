#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

source config
CAMINHO_PROJETO="$CAMINHO_DIRETORIO_PROJETO/$NOME_PROJETO"

wp --info 2> /dev/null >/dev/null
EXIST_WP_CLI=`echo $?`

bash install_wordpress.sh
mkdir ${CAMINHO_PROJETO}/wp-content/themes/${NOME_PROJETO}
git clone ${GIT_URL} ${CAMINHO_PROJETO}/wp-content/themes/${NOME_PROJETO}
cd ${CAMINHO_PROJETO}
theme=`wp theme list --field=name`
wp theme activate ${theme}
printf "${red}** instalando tema\n"


