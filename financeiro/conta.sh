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
		*
	FROM 
		contas 
			LEFT JOIN tipos_conta
				USING (cod_tipo_conta)
	WHERE 
		cod_conta = $codConta
;
"

	result=$(sqlite3 $dbFinanceiro "$sqlConta")


#         =================================================
	
	result=\""${result//|/\"" \""}"\"
	#result="${result//|/","}"
	
	contaObj=( $result )
	
	
	echo -e "\033[01;37mcod_conta:			\033[00;35m" ${contaObj[0]}
	echo -e "\033[01;37mcod_tipo_conta:			\033[00;35m" ${contaObj[1]}
	echo -e "\033[01;37mdescricao:			\033[00;35m" ${contaObj[2]}
	echo -e "\033[01;37mmes_referencia:			\033[00;35m" ${contaObj[3]}
	echo -e "\033[01;37mdt_vencimento:			\033[00;35m" ${contaObj[4]}
	echo -e "\033[01;37mcod_barras:			\033[00;35m" ${contaObj[5]}
	echo -e "\033[01;37mvalor:				\033[00;35m" ${contaObj[6]}
	echo -e "\033[01;37mcod_receita_pagadora:		\033[00;35m" ${contaObj[7]}
	echo -e "\033[01;37mcod_pagador:			\033[00;35m" ${contaObj[8]}
	echo -e "\033[01;37mconta_paga:			\033[00;35m" ${contaObj[9]}
	echo -e "\033[01;37mvalor_pago:			\033[00;35m" ${contaObj[10]}
	echo -e "\033[01;37mdt_pagamento:			\033[00;35m" ${contaObj[11]}
	
	
	
	echo -e "\033[0m"
	echo 
	echo "Fim da consulta (pressione enter)"
	read
	main

}

#conta

