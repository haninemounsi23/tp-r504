#!/bin/bash

hello1=0
hello2=0
erreurs=0

for i in {1..500}; do

    reponse=$(curl -s --max-time 5 http://localhost:83)

    if [[ "$reponse" == *"Hello 1"* ]]; then
        ((hello1++))
    elif [[ "$reponse" == *"Hello 2"* ]]; then
        ((hello2++))
    else
        ((erreurs++))
    fi

done

echo "========== RESULTATS =========="
echo "Serveur 1 : $hello1 réponses"
echo "Serveur 2 : $hello2 réponses"
echo "Erreurs   : $erreurs"
echo
echo "Serveur 1 : $((hello1 * 100 / 500)) %"
echo "Serveur 2 : $((hello2 * 100 / 500)) %"
