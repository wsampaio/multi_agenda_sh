#!/bin/bash

. ./financeiro/contaLista.sh 


#. ./script.sh --source-only

db="../sqlite"

clear


main(){
	clear
	echo "
Digite uma opcao:
1 - mostrar contas do mes
2 - sair
"

	read opcao

	if [ $opcao -eq 1 ]
	then
		clear
		contasDoMes
	elif [ $opcao -eq 2 ]
	then
		#do nothing
		clear
		echo "saída"
		echo
		echo "Developed by: linkedin.com/in/WELLSampaio"
		echo
		echo 
		read
		clear	
	else
		main
	fi
}





main









