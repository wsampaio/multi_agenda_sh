#!/bin/bash


conta(){
	
	#dbFinanceiro="$db/financeiro.db"
    codConta=$1

    clear
	echo -e "\033[0m"

	if [ ${#mesRef} -eq 0 ]
		then
			mesRef=`date +%m/%Y`
	fi

	sqlConta="


SELECT 
		codConta,
		contas.codTipoConta,
			REPLACE(descricao, ' ', '_')
		AS descricao,
		mesReferencia,
		dtVencimento,
		codBarras,
		valor,
		codReceitaPagadora,
		contas.codPagador,
		contaPaga,
		valorPago,
		dtPagamento

	FROM 
		contas 
			LEFT JOIN tiposContas
				USING (codTipoConta)
	WHERE 
		codConta = $codConta
;
"

	result=$(sqlite3 $dbFinanceiro "$sqlConta")


#         =================================================
	
	result=\""${result//|/\"" \""}"\"
	#result="${result//|/","}"
	
	contaObj=( $result )
	
	
	echo -e "\033[01;37mcodConta:			\033[00;35m" ${contaObj[0]}
	echo -e "\033[01;37mcodTipoConta:			\033[00;35m" ${contaObj[1]}
	echo -e "\033[01;37mdescricao:			\033[00;35m" ${contaObj[2]}
	echo -e "\033[01;37mmesReferencia:			\033[00;35m" ${contaObj[3]}
	echo -e "\033[01;37mdtVencimento:			\033[00;35m" ${contaObj[4]}
	echo -e "\033[01;37mcodBarras:			\033[00;35m" ${contaObj[5]}
	echo -e "\033[01;37mvalor:				\033[00;35m" ${contaObj[6]}
	echo -e "\033[01;37mcodReceitaPagadora:		\033[00;35m" ${contaObj[7]}
	echo -e "\033[01;37mcodPagador:			\033[00;35m" ${contaObj[8]}
	echo -e "\033[01;37mcontaPaga:			\033[00;35m" ${contaObj[9]}
	echo -e "\033[01;37mvalorPago:			\033[00;35m" ${contaObj[10]}
	echo -e "\033[01;37mdtPagamento:			\033[00;35m" ${contaObj[11]}
	
	
	
	echo -e "\033[0m"
	echo 
	echo "Fim da consulta (pressione enter)"
	read
	main

}

#conta

