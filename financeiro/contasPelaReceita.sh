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
			codReceita,
			length(codReceita))
		AS cod, 
			substr('                       ' ||
			pagador,
			length(pagador))
		AS tipo,
			strftime('%d/%m/%Y', dtCredito) 
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
				USING (codPagador)
	WHERE 
		codReceita = $codReceita
	ORDER BY
		dtCredito
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
			codConta,
			length(codConta))
		AS cod, 
			substr('                     ' ||
			tipoConta,
			length(tipoConta))
		AS tipo,
			strftime('%d/%m/%Y', dtVencimento) 
		AS vencimento, 
			substr('      ' ||
			printf('%.2f', valor),
			length(
			printf('%.2f', valor)
			))
		AS valor,
			CASE
				WHEN contaPaga = 1 THEN
					'pg'
				ELSE
					''
			END
		AS pago
	FROM 
		contas 
			LEFT JOIN tiposContas
				USING (codTipoConta)
	WHERE 
		codReceitaPagadora = $codReceita
	ORDER BY
		dtVencimento
;
"
	if [ -f $dbFinanceiro ]; then
			sqlite3 $dbFinanceiro "$sqlContasPelaReceita"
	else
		echo "O Banco de dados não existe"
	fi
	echo "====|======================|==========|=======|=="
	

	if [ -f $dbFinanceiro ]; then
		#soma valor das contas
		result=$(sqlite3 $dbFinanceiro "$sqlContasPelaReceita")
		lista=( \""${result//|/\"" \""}"\" )

		echo "lista"
		echo ${lista[1]}

	fi





	echo
	echo "Fim da consulta (pressione enter)"
	
	read

	main
	

}

#contasPelaReceita 10


