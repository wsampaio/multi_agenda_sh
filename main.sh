#!/bin/bash

. ./db.sh
. ./financeiro/contaLista.sh 
. ./financeiro/conta.sh 
. ./financeiro/receitaLista.sh

. ./financeiro/contasPelaReceita.sh

. ./passmots/origemRegistro.sh 
. ./passmots/origemRegistroLista.sh 



#. ./script.sh --source-only



main(){
	clear
	echo -e "\033[00;37m
Digite uma opcao:
\033[00;37mA - \033[01;35mContas
\033[00;37mB - \033[01;35mReceitas

\033[00;37mC - \033[01;35mRegistros de Senhas

\033[00;37mD - \033[01;35mSair
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
		clear
		origemRegistroLista
	elif [ ${opcao,,} = "d" ]
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









