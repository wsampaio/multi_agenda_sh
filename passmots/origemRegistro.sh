#!/bin/bash


origemRegistro(){
	
	#dbFinanceiro="$db/financeiro.db"
    codOrigemRegistro=$1

    clear
	echo -e "\033[0m"

	sqlOrigemRegistro="

SELECT 
		codOrigemRegistro,
		REPLACE(origemRegistro, ' ', '_')
	FROM 
		origensRegistro 
	WHERE 
		codOrigemRegistro = $codOrigemRegistro
;
"

	result=$(sqlite3 $dbPassMots "$sqlOrigemRegistro")


#         =================================================
	
	result=\""${result//|/\"" \""}"\"
	#result="${result//|/","}"
	
	origemRegistroObj=( $result )
	
	
	echo -e "\033[01;37mcodOrigemRegistro:			\033[00;35m" ${origemRegistroObj[0]}
	echo -e "\033[01;37morigemRegistro:			\033[00;35m" ${origemRegistroObj[1]}

			
        sqlRegistros="

SELECT
				substr(campo || '           ', 0, 11)
		AS campo,
		registro
	FROM
		registros
			LEFT JOIN tiposCampos
				USING (codTipoCampo)
	WHERE
		codOrigemRegistro = ${origemRegistroObj[0]}
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

#	echo -e "\033[01;37mcodOrigemRegistro:			\033[00;35m" ${origemRegistroObj[0]}
#	echo -e "\033[01;37morigemRegistro:			\033[00;35m" ${origemRegistroObj[1]}

	echo
	echo















	echo -e "\033[0m"
	echo 
	echo "Fim da consulta (pressione enter)"
	read
	main

}

#conta

