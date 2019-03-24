#!/bin/bash
RED='\033[0;31m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

bash ./utils/check-req.sh
REQ=$?

if [ $REQ == 0 ]; then
    echo "Numero de argumentos: $#"
    if [ $# -ge 1 ]; then
        COUNT=0
        for ARG in $*; do
            COUNT=`expr $COUNT + 1`
            case "$ARG" in
                "wp-cli")
                    printf "${PURPLE}** INSTALAR WPCLI \n${NC}"
                    bash ./installers/install_wp_cli.sh
                ;;
                "wordpress")
                    printf "${PURPLE}** INSTALAR WORDPRESS \n${NC}"
                    bash ./installers/install_wordpess.sh
                ;;
                "theme")
                    printf "${PURPLE}** INSTALAR TEMA \n${NC}"
                    bash ./installers/install_theme.sh
                ;;        
                *)
                    echo "default"
                ;;
            esac
        done
    else
        echo "dasd"
    fi
fi



