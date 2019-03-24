#!/bin/bash
funtion remove_base_file(){
    rm -rf ${CAMINHO_PROJETO}/wp-content/themes/*
    rm -rf ${CAMINHO_PROJETO}/wp-content/plugins/*
    rm -rf ${CAMINHO_PROJETO}/wp-content/languages/plugins/*
    rm -rf ${CAMINHO_PROJETO}/wp-content/languages/themes/*
}

remove_base_file()