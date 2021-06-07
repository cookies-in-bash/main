#!/bin/bash
#""""Cookie Clicker"""" version cutre en Bash, implementado:--- [X]=V3 Guardar/Restaurar // [ ELIMINADO (0.0.3) ] Niveles/Mas galletas por click llegados a cierto punto // [ ] Galletas automaticas // [ ] Actualizador (Si es que alguien quiere jugar a esto)

#trap 'echo $galletas > .cookies_save ; exit' ERR EXIT # No usable con el actualizador ----------------------------

clear
echo
echo
echo "Cookie clicker V0.0.11" 
actual=011
echo
echo "----------------------"
echo "Escribe N para iniciar"
echo "una nueva partida, C"
echo "para cargar una que se"
echo "haya guardado antes o A"
echo "para actualizar el juego"
read -p '> ' guardado
if [[ $guardado == N ]]
then
galletas=0
else
if [[ $guardado == C ]]
then
if [ -f .cookies_save ]
then
galletas=$(cat .cookies_save)
else
echo "No hay ningun archivo de guardado!!"
exit #Salir por que no hay archivo de guardado
fi
else
if [[ $guardado = A ]]
then
version_1=$(curl https://raw.githubusercontent.com/cookies-in-bash/main/main/version)
if [[ $version_1 > $actual ]]
then
sleep 1.5
wget https://raw.githubusercontent.com/cookies-in-bash/main/main/latest.bash -O $0
clear
echo "Version $version_1 encontrada en el repositorio, se han ajustado los permisos e instalado. Se ha actualizado de $actual a $version_1"
echo "Lista de novedades: https://raw.githubusercontent.com/cookies-in-bash/main/main/cambios.txt"
else
clear
echo "La version que tienes ($actual) ya es la mas reciente"
fi




exit
fi
echo "No te entiendo!"
exit
#Salir del programa
fi
fi



#Empezar el juego
while true
do
			clear
			echo -n "Galletas=$galletas "
			read -s
			#CODIGO ELIMINADO:
			#		if [[ $click == "guardar" ]] # (Era el nombre de la variable que se usaba en el read que hay 7 lineas debajo)
			#		then
			#		echo $galletas > .secreto_galletas
			#		else
			#		fi
			#Este codigo esta desactualizado y se elimino en la version 0.0.2
			echo $galletas > .cookies_save #Sistema de guardado, se podria refinar con TRAP, para solo guardar a la salida, ETA NUNCA			read -s
			let "galletas=galletas+1"
done



