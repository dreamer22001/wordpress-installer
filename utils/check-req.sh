#!/bin/bash
# REQUIRE PHP, MYSQL, PHP-mysql, GIT
RED='\033[0;31m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

php --version 2> /dev/null >/dev/null
EXIST_PHP=$? 

# VALIDA SE PHP EXISTE
if [ $EXIST_PHP != 0 ]; then
    printf "${RED}** PHP NÃO ENCONTRADO\n"
    exit 1
fi

type mysql 2> /dev/null >/dev/null
EXIST_MYSQL=$? 

# VALIDA SE PHP EXISTE
if [ $EXIST_MYSQL != 0 ]; then
    printf "${RED}** MYSQL NÃO ENCONTRADO\n"
    exit 1
fi

type git 2> /dev/null >/dev/null
EXIST_GIT=$? 

# VALIDA SE PHP EXISTE
if [ $EXIST_GIT != 0 ]; then
    printf "${RED}** GIT NÃO ENCONTRADO\n"
    exit 1
fi

php -m | grep mysqli 2> /dev/null >/dev/null

EXIST_PHPMYSQL=$? 

# VALIDA SE PHP EXISTE
if [ $EXIST_PHPMYSQL != 0 ]; then
    printf "${RED}** PHP MYSQLI NÃO ENCONTRADO\n"
    exit 1
fi

exit 0