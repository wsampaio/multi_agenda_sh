#!/bin/bash


origemRegistroLista(){
	
	dbPassMots="$db/passmots.db"

    clear
	echo
#             =================================================
	echo "cod |Origem do Registro"
	echo "====|============================================"

	sqlOrigensRegistro="

SELECT 
			substr('   ' ||
			codOrigemRegistro,
			length(codOrigemRegistro))
		AS cod, 
			substr(origemRegistro,
			0, 44)
		AS origem
	FROM 
		origensRegistro 
	ORDER BY
		origemRegistro
;

"
	if [ -f $dbPassmots ]; then
		sqlite3 $dbPassMots "$sqlOrigensRegistro"
	else
		echo "O Banco de dados não existe"
	fi
	
	echo
	echo "Fim da consulta. Digite:"
	echo "A - para detalhes do Registro;"
	echo "B - sair;"
	
	read opcao

	if [ ${opcao,,} = "a" ]
	then
		echo
		echo "digite o código do registro:"
		read codOrigemRegistro
		origemRegistro $codOrigemRegistro
		
	elif [ ${opcao,,} = "b" ]
	then
		main
	else
		origemRegistroLista
	fi
	
	
	
	

}

