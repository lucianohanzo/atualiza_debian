#!/bin/bash

# Testa se o usuário é "root".
Usu=$(whoami)
if [ "$Usu" == "root" ]; then
    clear && echo "Bem vindo, usuário $Usu!" && sleep 4
else
    clear && echo "#=== Usuário \"$Usu\", Não é permitido. ===#"
             echo "#=== Somente usuário root! === #" && sleep 5
    clear ; exit 1
fi

clear
echo -e "#=== O sistema será atualizado. ===#      |"
echo "                                          |"
echo "O que fazer após a atualização?           |"
echo "1 - Reiniciar.                            |"
echo "2 - Desligar.                             |"
echo -e "* - Continuar a usar o sistema.           |"
echo "                                          |"
echo "------------------------------------------|"

read -p "Digite a sua escolha : " Escolha


# atualiza lista de pacotes.
apt update && apt list --upgradable
clear && echo "Lista de pacotes atualizada!" && sleep 4

# Atualiza os pacotes do sistema.
clear && apt upgrade -y
clear && echo "Pacotes do sistema atualizados!" && sleep 2

# Escolha Final
case $Escolha in
    1)  clear 
        echo "Reiniciando o sistema" && sleep 4
        reboot ;;
    2)  clear 
        echo "Desligando o sistema" && sleep 4
        shutdown -h now ;;
    *)  clear
        echo "Sistema liberado!" && sleep 1;;
esac

