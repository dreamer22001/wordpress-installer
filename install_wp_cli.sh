#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

php --version
EXIST_PHP=$? 
# ADICIONAR CHECAGEM MYSQL
if [ $EXIST_PHP != 0 ]; then
    echo exists
    wp --info 2> /dev/null >/dev/null
    EXIST_WP_CLI=`echo $?`
    if [[ $EXIST_WP_CLI != 0 ]]; then
        curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
        if [[ -f "wp-cli.phar" ]]; then
            chmod +x wp-cli.phar
            RET=`mv wp-cli.phar /usr/local/bin/wp`
            echo $RET
            if [[ ${RET} -eq 0 ]]; then
                printf "${RED}** WP-CLI INSTALADO COM SUCESSO\n"
            fi
        else
            printf "${RED}** OCORREU UM ERRO AO BAIXAR WP-CLI\n"
        fi
    else
        printf "${RED}** WP-CLI JÁ INSTALADO\n"
    fi
else
    printf "${RED}** PHP NÃO ENCONTRADO\n"
fi