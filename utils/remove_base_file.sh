#!/bin/bash

MY_PATH="`dirname \"$0\"`"
CONFIG_PATH="$MY_PATH/../config"
source $CONFIG_PATH
CAMINHO_PROJETO="$CAMINHO_DIRETORIO_PROJETO/$NOME_PROJETO"

remove_base_file (){
    rm -rf $CAMINHO_PROJETO/wp-content/themes/*
    rm -rf ${CAMINHO_PROJETO}/wp-content/plugins/*
    rm -rf ${CAMINHO_PROJETO}/wp-content/languages/plugins/*
    rm -rf ${CAMINHO_PROJETO}/wp-content/languages/themes/*

}
printf "${RED}** REMOVENDO ARQUIVOS.\n"
remove_base_file
