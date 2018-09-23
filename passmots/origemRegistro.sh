#!/bin/bash


origemRegistro(){
	
	#dbFinanceiro="$db/financeiro.db"
    codOrigemRegistro=$1

    clear
	echo -e "\033[0m"

	sqlOrigemRegistro="

SELECT 
		cod_origem_registro,
		REPLACE(origem_registro, ' ', '_')
	FROM 
		origens_registro 
	WHERE 
		cod_origem_registro = $codOrigemRegistro
;
"

	result=$(sqlite3 $dbPassMots "$sqlOrigemRegistro")


#         =================================================
	
	result=\""${result//|/\"" \""}"\"
	#result="${result//|/","}"
	
	origemRegistroObj=( $result )
	
	
	echo -e "\033[01;37mcod_origem_registro:			\033[00;35m" ${origemRegistroObj[0]}
	echo -e "\033[01;37morigem_registro:			\033[00;35m" ${origemRegistroObj[1]}

			
        sqlRegistros="

SELECT
				substr(campo || '           ', 0, 11)
		AS campo,
		registro
	FROM
		registros
			LEFT JOIN tipos_campos
				USING (cod_tipo_campo)
	WHERE
		cod_origem_registro = ${origemRegistroObj[0]}
	ORDER BY
		ordem
;

"

#	result2=$(sqlite3 $dbPassMots "$sqlRegistros")

#	registroObj=( $result2 )


	echo -e "\033[0m"

	echo
#             =================================================
        echo "campo     |Registro"
        echo "==========|======================================"
#	echo ${registroObj[0]} " - " ${registroObj[1]}

	sqlite3 $dbPassMots "$sqlRegistros"

#	echo -e "\033[01;37mcod_origem_registro:			\033[00;35m" ${origemRegistroObj[0]}
#	echo -e "\033[01;37morigem_registro:			\033[00;35m" ${origemRegistroObj[1]}

	echo
	echo















	echo -e "\033[0m"
	echo 
	echo "Fim da consulta (pressione enter)"
	read
	main

}

#conta

