#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color
MY_PATH="`dirname \"$0\"`"
CONFIG_PATH="$MY_PATH/../"config

function make_questions () {
    printf "$1"
    read INPUT
    echo "$2='$INPUT'" >> $CONFIG_PATH
}


if [[ ! -f "config" ]]; then
    touch $CONFIG_PATH
else
    rm $CONFIG_PATH
    touch $CONFIG_PATH
fi

printf "${PURPLE}** Responda as questões a seguir:\n"
make_questions "Qual é nome do projeto? \n" "NOME_PROJETO"
make_questions "Qual é caminho para o diretorio do projeto? Usar caminho a partir da raiz. \n" "CAMINHO_DIRETORIO_PROJETO"
make_questions "Qual é o nome do banco de dados? \n" "DBNAME"
make_questions "Qual é o nome do usuario do banco de dados? \n" "DBUSER"
make_questions "Qual é a senha do banco de dados? \n" "DBPASS"
make_questions "Qual é host do banco de dados? Ex.: localhost \n" "DBHOST"
make_questions "Qual é o prefixo que o banco dados deve usar? Ex.: wp_ \n" "DBPREFIX"
make_questions "Digite o dominio do projeto (Ex.: localhost): \n" "URL"
make_questions "Digite o titulo do site: \n" "TITLE"
make_questions "Digite seu nome de usuario: \n" "ADMIN_USER"
make_questions "Digite sua senha: \n" "ADMIN_PASSWORD"
make_questions "Digite seu email: \n" "ADMIN_EMAIL"
make_questions "Qual é o url do git do tema deste projeto: \n" "GIT_URL"
