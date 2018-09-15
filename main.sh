#!/bin/bash

. ./db.sh
. ./financeiro/contaLista.sh 
. ./financeiro/conta.sh 
. ./financeiro/receitaLista.sh

. ./financeiro/contasPelaReceita.sh

#. ./script.sh --source-only



main(){
	clear
	echo -e "\033[00;37m
Digite uma opcao:
\033[00;37ma - \033[01;35mContas
\033[00;37mb - \033[01;35mReceitas
\033[00;37mc - \033[01;35mSair
"

	read opcao

${opcao,,} = "a"

	if [ ${opcao,,} = "a" ]
	then
		clear
		contaLista
	elif [ ${opcao,,} = "b" ]
	then
		clear
		receitaLista
	elif [ ${opcao,,} = "c" ]
	then
		#do nothing
		clear
		echo -e "\033[01;31m"
		echo "saída"
		echo
		echo "Developed by: linkedin.com/in/WELLSampaio"
		echo -e "\033[00m"
		echo 
		#sleep 3
		read
		clear	
	else
		main
	fi
}





main









