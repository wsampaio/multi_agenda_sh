#!/bin/bash


contasPelaReceita(){
	
	dbFinanceiro="$db/financeiro.db"
	
    codReceita=$1

    clear
	echo -e "\033[00;37m"

	echo
#         =================================================
	echo "====|========================|==========|========"

	sqlReceita="


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
		cod_receita = $codReceita
	ORDER BY
		dt_credito
;
"
	if [ -f $dbFinanceiro ]; then
		sqlite3 $dbFinanceiro "$sqlReceita"
	else
		echo "O Banco de dados não existe"
	fi
	
	echo "====|========================|==========|========"

	echo
	
	
	
	echo "====|======================|==========|=======|=="

	sqlContasPelaReceita="


SELECT 
			substr('   ' ||
			cod_conta,
			length(cod_conta))
		AS cod, 
			substr('                     ' ||
			tipo_conta,
			length(tipo_conta))
		AS tipo,
			strftime('%d/%m/%Y', dt_vencimento) 
		AS vencimento, 
			substr('      ' ||
			printf('%.2f', valor),
			length(
			printf('%.2f', valor)
			))
		AS valor,
			CASE
				WHEN conta_paga = 1 THEN
					'pg'
				ELSE
					''
			END
		AS pago
	FROM 
		contas 
			LEFT JOIN tipos_conta
				USING (cod_tipo_conta)
	WHERE 
		cod_receita_pagadora = $codReceita
	ORDER BY
		dt_vencimento
;
"
	if [ -f $dbFinanceiro ]; then
		sqlite3 $dbFinanceiro "$sqlContasPelaReceita"
	else
		echo "O Banco de dados não existe"
	fi
	echo "====|======================|==========|=======|=="
	

	echo
	echo "Fim da consulta (pressione enter)"
	
	read

	main
	

}

#contasPelaReceita 10


