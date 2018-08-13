#!/bin/bash


conta(){
	
    db="../../multi_agenda_java/DB-multi_agenda"
	dbFinanceiro="$db/financeiro.db"
    codConta=800

    clear
	echo -e "\033[00;37m"
	echo "Digite o mês/ano de referência (mm/aaaa):"
	read cod_conta

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
		*
	FROM 
		contas 
			LEFT JOIN tipos_conta
				USING (cod_tipo_conta)
	WHERE 
		cod_conta = $codConta
;
"

	result=$(sqlite3 $dbFinanceiro  ".separator ';';" "$sql")

	echo $result
	echo
	echo "Fim da consulta (pressione enter)"
	read
	main

}

conta

