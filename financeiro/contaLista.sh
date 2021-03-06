#!/bin/bash


contaLista(){
	
	dbFinanceiro="$db/financeiro.db"

    clear
	echo -e "\033[00;37m"
	echo "Digite o mês/ano de referência (mm/aaaa):"
	read mesRef

	if [ ${#mesRef} -eq 0 ]
		then
			mesRef=`date +%m/%Y`
	fi

	clear
	echo
	echo "Contas referêntes ao mês: $mesRef"
	echo
#             =================================================
	echo "====|======================|==========|=======|=="

	sqlContaLista="


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
		strftime('%m/%Y', dtVencimento) = '$mesRef'
	ORDER BY
		dtVencimento
;
"
	if [ -f $dbFinanceiro ]; then
		sqlite3 $dbFinanceiro "$sqlContaLista"
	else
		echo "O Banco de dados não existe"
	fi
	
	echo
	echo "Fim da consulta. Digite:"
	echo "(enter) - Nova consulta;"
	echo "A - para detalhes da conta;"
	echo "B - sair;"
	
	read opcao

	if [ ${opcao,,} = "a" ]
	then
		echo
		echo "digite o código da conta:"
		read codConta
		conta $codConta
	elif [ ${opcao,,} = "b" ]
	then
		main
	else
		contaLista
	fi

}

