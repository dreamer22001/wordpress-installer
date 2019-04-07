#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color
MY_PATH="`dirname \"$0\"`"
CONFIG_PATH="$MY_PATH/../config"

export PATH=$PATH:/Applications/MAMP/Library/bin/

if [ -f "$CONFIG_PATH" ]; then
    source $CONFIG_PATH

    CAMINHO_PROJETO="$CAMINHO_DIRETORIO_PROJETO/$NOME_PROJETO"

    wp --info 2> /dev/null >/dev/null
    EXIST_WP_CLI=`echo $?`

    if [[ $EXIST_WP_CLI != 0 ]]; then
        printf "${RED}** INSTALANDO WP-CLI\n"
        bash install_wp_cli.sh
        mkdir ${CAMINHO_PROJETO}
        wp core download --path=${CAMINHO_PROJETO} --locale=pt_BR
        bash "$MY_PATH/../utils/remove_base_file.sh"
        cd ${CAMINHO_PROJETO}
        wp config create --dbname=${DBNAME} --dbuser=${DBUSER} --dbpass=${DBPASS} --dbhost=${DBHOST} --dbprefix=${DBPREFIX}
        wp db create
        wp core install --url=${URL} --title=${TITLE} --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL}
        printf "${RED}** WORDPRESS INSTALADO COM SUCESSO\n"
    else
        if [[ ! -d ${CAMINHO_PROJETO} ]]; then
            mkdir ${CAMINHO_PROJETO}
            wp core download --path=${CAMINHO_PROJETO} --locale=pt_BR
            bash "$MY_PATH/../utils/remove_base_file.sh"
            cd ${CAMINHO_PROJETO}
            wp config create --dbname=${DBNAME} --dbuser=${DBUSER} --dbpass=${DBPASS} --dbhost=${DBHOST} --dbprefix=${DBPREFIX}
            wp db create
            wp core install --url=${URL} --title=${TITLE} --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL}
            printf "${RED}** WORDPRESS INSTALADO COM SUCESSO\n"
        else
            printf "${RED}** WORDPRESS JÁ INSTALADO COM SUCESSO\n"
        fi
    fi
fi