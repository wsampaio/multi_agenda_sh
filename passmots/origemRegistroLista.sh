#!/bin/bash


origemRegistroLista(){
	
	dbPassmots="$db/passmots.db"

    clear
	echo
#             =================================================
	echo "cod |Origem do Registro"
	echo "====|============================================"

	sqlOrigensRegistro="

SELECT 
			substr('   ' ||
			cod_origem_registro,
			length(cod_origem_registro))
		AS cod, 
			substr(origem_registro,
			0, 44)
		AS origem
	FROM 
		origens_registro 
	ORDER BY
		origem_registro
;

"
	if [ -f $dbPassmots ]; then
		sqlite3 $dbPassmots "$sqlOrigensRegistro"
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
		conta $codOrigemRegistro
	elif [ ${opcao,,} = "b" ]
	then
		main
	else
		origemRegistroLista
	fi
	
	
	
	

}

