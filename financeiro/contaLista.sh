#!/bin/bash


contasDoMes(){
	
	dbFinanceiro="$db/financeiro.db"

    clear
	echo -e "\033[00;37m"
	echo "Digite o mês/ano de referência (mm/aaaa):"
	read mesRef

	if [ ${#mesRef} -eq 0 ]
		then
			mesRef=`date +%m/%Y`
	fi

	echo
	echo "Contas referêntes ao mês: $mesRef"
	echo
	echo "====|======================|==========|=======|=="

	sql="


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
		strftime('%m/%Y', dt_vencimento) = '$mesRef'
	ORDER BY
		dt_vencimento
;
"

	sqlite3 $dbFinanceiro  "$sql"

	echo
	echo
	echo "Fim da consulta (pressione enter)"
	read
	main

}

