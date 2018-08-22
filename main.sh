#!/bin/bash

. ./financeiro/contaLista.sh 
. ./financeiro/conta.sh 
. ./financeiro/receitaLista.sh

#. ./script.sh --source-only


db="../DB-multi_agenda"
#db="../sqlite"

main(){
	clear
	echo -e "\033[00;37m
Digite uma opcao:
\033[00;37m1 - \033[01;35mmostrar contas do mes
\033[00;37m2 - \033[01;35mReceitas
\033[00;37m3 - \033[01;35msair
"

	read opcao

	if [ $opcao -eq 1 ]
	then
		clear
		contaLista
	elif [ $opcao -eq 2 ]
	then
		clear
		receitaLista
	elif [ $opcao -eq 3 ]
	then
		#do nothing
		clear
        echo -e "\033[01;31m"
		echo "saída"
		echo
		echo "Developed by: linkedin.com/in/WELLSampaio"
		echo
		echo 
		#sleep 3
		read
		clear	
	else
		main
	fi
}





main









