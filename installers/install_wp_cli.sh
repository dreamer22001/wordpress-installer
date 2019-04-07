#!/bin/bash
# REQUIRE PHP, MYSQL, PHP-mysql, GIT
RED='\033[0;31m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

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
            exit 0
        fi
    else
        printf "${RED}** OCORREU UM ERRO AO BAIXAR WP-CLI\n"
        exit 1
    fi
else
    printf "${RED}** WP-CLI JÁ INSTALADO\n"
    exit 1
fi
