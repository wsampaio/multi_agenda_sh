#!/bin/bash


receitaLista(){
	
	dbFinanceiro="$db/financeiro.db"

	clear
	echo -e "\033[00;37m"
	echo "Digite o mês/ano de referência (mm/aaaa):"
	read mesRef

	if [ ${#mesRef} -eq 0 ]
		then
			mesRef=`date +%m/%Y`
	fi

	clear
	echo
	echo "Receita referêntes ao mês: $mesRef"
	echo
#             =================================================
	echo "====|========================|==========|========"

	sqlReceitaLista="


SELECT 
			substr('   ' ||
			cod_receita,
			length(cod_receita))
		AS cod, 
			substr('                       ' ||
			pagador,
			length(pagador))
		AS tipo,
			strftime('%d/%m/%Y', dt_credito) 
		AS vencimento, 
			substr('       ' ||
			printf('%.2f', valor),
			length(
			printf('%.2f', valor)
			))
		AS valor

	FROM 
		receita 
			LEFT JOIN pagadores
				USING (cod_pagador)
	WHERE 
		strftime('%m/%Y', mes_referencia) = '$mesRef'
	ORDER BY
		dt_credito
;
"
	if [ -f $dbFinanceiro ]; then
		sqlite3 $dbFinanceiro "$sqlReceitaLista"
	else
		echo "O Banco de dados não existe"
	fi
	





	echo
	echo "Fim da consulta. Digite:"
	echo "(enter) - Nova consulta;"
	echo "A - para detalhes da receita"
	echo "B - para contas pagas pela receita"
	echo "C - sair;"
							
	read opcao
				
	if [ ${opcao,,} = "a" ]
	then
		echo
		echo "digite o código da receita:"
		read codReceita
		#receita $codReceita
		main
	elif [ ${opcao,,} = "b" ]
	then
		echo
		echo "digite o código da receita:"
		read codReceita
		contasPelaReceita $codReceita
	elif [ ${opcao,,} = "c" ]
	then
		main
	else
		receitaLista
	fi

}

