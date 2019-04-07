#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color
MY_PATH="`dirname \"$0\"`"
echo $MY_PATH
CONFIG_PATH="$MY_PATH/../config"

if [ -f "$CONFIG_PATH" ]; then
    source $CONFIG_PATH
    CAMINHO_PROJETO="$CAMINHO_DIRETORIO_PROJETO/$NOME_PROJETO"

    wp --info 2> /dev/null >/dev/null
    EXIST_WP_CLI=`echo $?`

    bash $MY_PATH"/"install_wordpress.sh
    mkdir ${CAMINHO_PROJETO}/wp-content/themes/${NOME_PROJETO}
    git clone ${GIT_URL} ${CAMINHO_PROJETO}/wp-content/themes/${NOME_PROJETO}
    cd ${CAMINHO_PROJETO}
    theme=`wp theme list --field=name`
    wp theme activate ${theme}
    printf "${red}** instalando tema\n"
fi




