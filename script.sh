#!/bin/bash
# In diesem Script sucht der Nutzer in einer bestimmten Datei nach bestimmten Wörtern. Die Zeilen, die das gesuchte Wort enthalten werden zurückgegeben.
# Devin de Spindler
# 2024-05-21
# Version 1.0

STANDART_FARBE='\033[0m' # Wie man es als Standart eingestellt hat
ROT_SCHWARZ='\033[31;40m' # Rot auf schwarz
GRUEN_SCHWARZ='\033[32;40m' # Grün auf schwarz
BLAU_SCHWARZ='\033[34;40m' # Blau auf schwarz


cd Beispieldateien
echo -e "${ROT_SCHWARZ}$(ls)${STANDART_FARBE}"

while true; do
    read -p 'Wollen Sie aus allen vorhandenen Dateien die Suchbegriffe wissen? (j/n): ' ANTWORT

    if [[ ${ANTWORT} == "j" ]]; then
        read -p 'Bitte geben Sie das Wort an, nach dem Sie suchen wollen: ' SUCHBEGRIFF

        while true; do
            echo -n -e "Wollen Sie den eingegebenen Suchbegriff ${GRUEN_SCHWARZ}alleine stehend${STANDART_FARBE} oder auch ${BLAU_SCHWARZ}als Teil eines längeren Wortes${STANDART_FARBE} finden? (${GRUEN_SCHWARZ}a${STANDART_FARBE}/${BLAU_SCHWARZ}t${STANDART_FARBE}): "
            read ANTWORT2
            
            if [[ ${ANTWORT2} == "a" ]]; then
                grep -iw ${SUCHBEGRIFF} *.txt # grep -i macht Gross- und Kleinschreibung unwichtig
                exit
            elif [[ ${ANTWORT2} == "t" ]]; then
                grep -i ${SUCHBEGRIFF} *.txt # grep -w macht, dass der Suchbegriff exakt mit der ANTWORT2 übereinstimmen muss.
                exit
            else
                echo -e "Bitte wählen Sie ${GRUEN_SCHWARZ}'a'${STANDART_FARBE} für a${GRUEN_SCHWARZ}lleine stehend${STANDART_FARBE} oder ${BLAU_SCHWARZ}'t'${STANDART_FARBE} für ${BLAU_SCHWARZ}Teil eines längeren Wortes${STANDART_FARBE}."
            fi
        done
        


    elif [[ ${ANTWORT} == "n" ]]; then
        read -p 'Bitte geben Sie den Namen der Datei an, in der Sie suchen wollen: ' DATEINAME
        read -p 'Bitte geben Sie das Wort an, nach dem Sie suchen wollen: ' SUCHBEGRIFF

        while true; do
            echo -n -e "Wollen Sie den eingegebenen Suchbegriff ${GRUEN_SCHWARZ}alleine stehend${STANDART_FARBE} oder auch ${BLAU_SCHWARZ}als Teil eines längeren Wortes${STANDART_FARBE} finden? (${GRUEN_SCHWARZ}a${STANDART_FARBE}/${BLAU_SCHWARZ}t${STANDART_FARBE}): "
            read ANTWORT2

            if [[ ${ANTWORT2} == "a" ]]; then
                grep -iw ${SUCHBEGRIFF} ${DATEINAME} 
                exit
            elif [[ ${ANTWORT2} == "t" ]]; then
                grep -i ${SUCHBEGRIFF} ${DATEINAME}
                exit
            else
                echo -e "Bitte wählen Sie ${GRUEN_SCHWARZ}'a'${STANDART_FARBE} für a${GRUEN_SCHWARZ}lleine stehend${STANDART_FARBE} oder ${BLAU_SCHWARZ}'t'${STANDART_FARBE} für ${BLAU_SCHWARZ}Teil eines längeren Wortes${STANDART_FARBE}."
            fi
        done
    else
        echo 'Bitte wählen Sie j (ja) oder n (nein) aus, ob Sie aus allen vorhandenen Dateien die Suchbegriffe wissen wollen.'
    fi
done







