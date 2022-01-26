#!/bin/bash


i=0
d=1

sed 'y/áÁàÀãÃâÂéÉêÊíÍóÓõÕôÔúÚçÇ/aAaAaAaAeEeEiIoOoOoOuUcC/' < Lista > ListaSemA 					 #Remove Todos Acentos dos nomes


tr 'A-Z' 'a-z'  < ListaSemA > ListaSemA2.txt									#Troca letras maisculas por minusculas

while [ $i -le 9 ]; do											#Desmenbra todos os nomes em 10 pedaços os menos
	if [ $i == 0 ]; then
		nome[0]=`cat -n ListaSemA2.txt | head -n 1 | tail -n 1` 		#Condição 0  por bug
		echo "${nome[0]}" > Nomes0.txt
		sed 's/[0-9]\+//g' < Nomes0.txt > Nome0.txt
		inteiro[0]=`cat Nome0.txt`
		nome[0]=`cut -d" " -f6 Nome0.txt`
		sobrenome[0]=`cut -d" " -f7 Nome0.txt`	
		terceironome[0]=`cut -d" " -f8 Nome0.txt`
		quartonome[0]=`cut -d" " -f9 Nome0.txt`
		quintonome[0]=`cut -d" " -f10 Nome0.txt`
		sextonome[0]=`cut -d" " -f11 Nome0.txt`
		setimonome[0]=`cut -d" " -f9 Nome0.txt`
		oitavonome[0]=`cut -d" " -f9 Nome0.txt`
		nononome[0]=`cut -d" " -f9 Nome0.txt`
		decimonome[0]=`cut -d" " -f9 Nome0.txt`
		sed -i 's/^://' Nome0.txt
		let quant[0]=`cat Nome0.txt |  wc -w`

	else
		if [ $i == 9 ]; then							#Condição 9 por bug
			nome[9]=`cat -n ListaSemA2.txt | grep -n ^ | grep ^10`
			echo "${nome[9]}" > Nomes9.txt
			sed 's/[0-9]\+//g' < Nomes9.txt > Nome9.txt
			inteiro[9]=`cat Nome9.txt`
			sobrenome[9]=`cut -d" " -f7 Nome9.txt`
			nome[9]=`cut -d" " -f6 Nome9.txt`
			terceironome[9]=`cut -d" " -f8 Nome9.txt`
			quartonome[9]=`cut -d" " -f9 Nome9.txt`
			quintonome[9]=`cut -d" " -f10 Nome9.txt`
			sextonome[9]=`cut -d" " -f11 Nome9.txt`
			setimonome[9]=`cut -d" " -f9 Nome9.txt`
			oitavonome[9]=`cut -d" " -f9 Nome9.txt`
			nononome[9]=`cut -d" " -f9 Nome9.txt`
			decimonome[9]=`cut -d" " -f9 Nome9.txt`
			sed -i 's/^://' Nome9.txt
			let quant[9]=`cat Nome9.txt |  wc -w`
		else
					nome[$i]=`cat -n ListaSemA2.txt | grep -n ^ | grep ^$d`			#Condições em gerais.
					echo "${nome[$i]}" > Nomes$i.txt
					sed 's/[0-9]\+//g' < Nomes$i.txt > Nome$i.txt
					inteiro[$i]=`cat Nome$i.txt`
					sobrenome[$i]=`cut -d" " -f7 Nome$i.txt`
					nome[$i]=`cut -d" " -f6 Nome$i.txt`
					terceironome[$i]=`cut -d" " -f8 Nome$i.txt`
					quartonome[$i]=`cut -d" " -f9 Nome$i.txt`
					quintonome[$i]=`cut -d" " -f10 Nome$i.txt`
					sextonome[$i]=`cut -d" " -f11 Nome$i.txt`
					setimonome[$i]=`cut -d" " -f9 Nome$i.txt`
					oitavonome[$i]=`cut -d" " -f9 Nome$i.txt`
					nononome[$i]=`cut -d" " -f9 Nome$i.txt`
					decimonome[$i]=`cut -d" " -f9 Nome$i.txt`
					sed -i 's/^://' Nome$i.txt
					let quant[$i]=`cat Nome$i.txt | wc -w`
		fi

	fi
		let i=$i+1				#Contadores do loop
		let d=$d+1
		let quant[$i]=${quant[$i]}-1
	
done

	primeirasletras (){							#Função que pega primeira letra dos nomes/sobrenomes
		echo "${nome[$i]}" > LetraPrimeira$i.txt
		echo "${sobrenome[$i]}" > LetraSobrenome$i.txt
		echo "${terceironome[$i]}" > LetraTerceiro$i.txt
		echo "${quartonome[$i]}" > LetraQuarto$i.txt
		echo "${quintonome[$i]}" > LetraQuinto$i.txt
		echo "${sextonome[$i]}" > LetraSexto$i.txt
		echo "${setimonome[$i]}" > LetraSetimo$i.txt
		echo "${oitavonome[$i]}" > LetraOitavo$i.txt
		echo "${nononome[$i]}" > LetraNono$i.txt
		echo "${decimonome[$i]}" > LetraDecimo$i.txt
		pnome[$i]=`cat LetraPrimeira$i.txt  | tr -d "	" | cut -b 1`
		lsobre[$i]=`cat LetraSobrenome$i.txt | cut -b 1`
		tsobre[$i]=`cat LetraTerceiro$i.txt | cut -b 1`
		qsobre[$i]=`cat LetraQuarto$i.txt | cut -b 1`
		Qusobre[$i]=`cat LetraQuinto$i.txt | cut -b 1 `	
		Ssobre[$i]=`cat LetraSexto$i.txt | cut -b 1`
		Sesobre[$i]=`cat LetraSetimo$i.txt | cut -b 1`
		Osobre[$i]=`cat LetraOitavo$i.txt | cut -b 1`
		Nsobre[$i]=`cat LetraNono$i.txt | cut -b 1`
		Dsobre[$i]=`cat LetraDecimo$i.txt | cut -b 1`


}

i=0 
k=0


while [ $i -le 9 ]; do	
								#Monta o usuario apartir das condições

	echo "${nome[$i]}" > Usuarios$i.txt 	#Primeira condição
	sed 's/[0-9]\+//g' < Usuarios$i.txt > Usuario$i.txt
	verificador[$i]=`cat Usuario$i.txt`
	x=0
	t=0
	while [ $x -le $i ]; do 
	primeirasletras									#Chama função das letras

	if [ "${verificador[$i]}" == "${verificador[$x]}" ] && [ "$x" != "$i" ]; then #Segunda Condição
		echo "${sobrenome[$i]}" > Usuario$i.txt
		
		verificador[$i]=`cat Usuario$i.txt`
		verificador[$i]=`expr substr ${verificador[$i]} 1 10` #limita caractere ate 10 
		pass1=1
		
		
	fi


	if [ "${verificador[$i]}" == "${verificador[$x]}" ] && [ "$x" != "$i" ] && [ $pass1=1 ]; then #Terceira Condição
		if [ ${quant[$i]} == 2 ]; then
			echo "${nome[$i]}${lsobre[$i]}" > Usuario$i.txt
fi
		if [ ${quant[$i]} == 3 ]; then
			echo "${nome[$i]}${lsobre[$i]}${tsobre[$i]}" > Usuario$i.txt
fi
		if [ ${quant[$i]} == 4 ]; then
			echo "${nome[$i]}${lsobre[$i]}${tsobre[$i]}${qsobre[$i]}" > Usuario$i.txt
fi
		if [ ${quant[$i]} == 5 ]; then
			echo "${nome[$i]}${lsobre[$i]}${tsobre[$i]}${qsobre[$i]}${Qusobre[$i]}" > Usuario$i.txt
fi
		if [ ${quant[$i]} == 6 ]; then
			echo "${nome[$i]}${lsobre[$i]}${tsobre[$i]}${qsobre[$i]}${Qusobre[$i]}${Ssobre[$i]}" > Usuario$i.txt
fi
		if [ ${quant[$i]} == 7 ]; then
			echo "${nome[$i]}${lsobre[$i]}${tsobre[$i]}${qsobre[$i]}${Qusobre[$i]}${Ssobre[$i]}${Sesobre[$i]}" > Usuario$i.txt
fi
		if [ ${quant[$i]} == 8 ]; then
			echo "${nome[$i]}${lsobre[$i]}${tsobre[$i]}${qsobre[$i]}${Qusobre[$i]}${Ssobre[$i]}${Sesobre[$i]}${Osobre[$i]}" > Usuario$i.txt
fi
		if [ ${quant[$i]} == 9 ]; then
			 echo "${nome[$i]}${lsobre[$i]}${tsobre[$i]}${qsobre[$i]}${Qusobre[$i]}${Ssobre[$i]}${Sesobre[$i]}${Osobre[$i]}${Nsobre[$i]}" > Usuario$i.txt
fi
		if [ ${quant[$i]} == 10 ]; then
			echo "${nome[$i]}${lsobre[$i]}${tsobre[$i]}${qsobre[$i]}${Qusobre[$i]}${Ssobre[$i]}${Sesobre[$i]}${Osobre[$i]}${Nsobre[$i]}${Dsobre[$i]}" > Usuario$i.txt
fi

		
		



			verificador[$i]=`cat Usuario$i.txt`
			verificador[$i]=`expr substr ${verificador[$i]} 1 10` #limita caractere ate 10
			pass2=1	
			t=0
	fi

 
	if [ "${verificador[$i]}" == "${verificador[$t]}" ] && [ "$x" != "$i" ] && [ $pass2=1 ]; then #Quarta e ultima condição
		if [ ${quant[$i]} == 2 ]; then
			echo "${pnome[$i]}${sobrenome[$i]}" > Usuario$i.txt
		fi
		if [ ${quant[$i]} == 3 ]; then
			echo "${pnome[$i]}${lsobre[$i]}${terceironome[$i]}" > Usuario$i.txt
		fi
		if [ ${quant[$i]} == 4 ]; then
			echo "${pnome[$i]}${lsobre[$i]}${tsobre[$i]}${quartonome[$i]}" > Usuario$i.txt	
		fi
		if [ ${quant[$i]} == 5 ]; then
			echo "${pnome[$i]}${lsobre[$i]}${tsobre[$i]}${qsobre[$i]}${quintonome[$i]}" > Usuario$i.txt
		fi
		if [ ${quant[$i]} == 6 ]; then
			echo "${pnome[$i]}${lsobre[$i]}${tsobre[$i]}${qsobre[$i]}${Qusobre[$i]}${sextonome[$i]}" > Usuario$i.txt	
		fi
		if [ ${quant[$i]} == 7 ]; then
			echo "${pnome[$i]}${lsobre[$i]}${tsobre[$i]}${qsobre[$i]}${Qusobre[$i]}${Ssobre[$i]}${setimonome[$i]}" > Usuario$i.txt
		fi
		if [ ${quant[$i]} == 8 ]; then
			echo "${pnome[$i]}${lsobre[$i]}${tsobre[$i]}${qsobre[$i]}${Qusobre[$i]}${Ssobre[$i]}${Sesobre[$i]}${oitavonome[$i]}" > Usuario$i.txt
		fi
		if [ ${quant[$i]} == 9 ]; then
			echo "${pnome[$i]}${lsobre[$i]}${tsobre[$i]}${qsobre[$i]}${Qusobre[$i]}${Ssobre[$i]}${Sesobre[$i]}${Osobre[$i]}${nononome[$i]}" > Usuario$i.txt
		fi
		if [ ${quant[$i]} == 10 ]; then
			echo "${pnome[$i]}${lsobre[$i]}${tsobre[$i]}${qsobre[$i]}${Qusobre[$i]}${Ssobre[$i]}${Sesobre[$i]}${Osobre[$i]}${Nsobre[$i]}${decimonome[$i]}" > Usuario$i.txt
		fi
		
		verificador[$i]=`cat Usuario$i.txt`
		verificador[$i]=`expr substr ${verificador[$i]} 1 10` #limita caractere ate 10
	fi
	let t=$t+1
	let x=$x+1



	done
	let i=$i+1

done


rm -r *.txt
i=0

	
touch UsuariosFinais.txt		#Simula a criação dos usuarios dando o login num .txt

	echo -e "Usuario 1 é ${verificador[0]}\nUsuario 2 é ${verificador[1]}\nUsuario 3 é ${verificador[2]}\nUsuario 4 é ${verificador[3]}\nUsuario 5 é ${verificador[4]}\nUsuario 6 é ${verificador[5]}\nUsuario 7 é ${verificador[6]}\nUsuario 8 é ${verificador[7]}\nUsuario 9 é ${verificador[8]}\nUsuario 10 é ${verificador[9]}\n " | tr -d "	"  > UsuariosFinais.txt









