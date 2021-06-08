#!/bin/bash
#""""Cookie Clicker"""" version cutre en Bash, implementado:--- [ ELIMINADO (0.0.3) ] Niveles/Mas galletas por click llegados a cierto punto // [ ] Galletas automaticas // [x] Actualizador (Si es que alguien quiere jugar a esto)

#trap 'echo $galletas > .cookies_save ; exit' ERR EXIT # No usable con el actualizador ---------------------------- (Lo mirare mas tarde)

if [[ $1 == "--debug" ]]
then
clear
echo
echo
echo "Cookie clicker V0.0.15 (MODO DEBUG)"
echo
echo "----------------------"
echo "Modo debug"
echo "Argumento 1= Galletas inicales ($2)"
echo "Argumento 2= Galletas/click ($3)"
echo "Argumento 3= (si/no) esconder informacion (Aun no implementado)"
echo 
galletas=$2
while true
do
			echo -n "Galletas=$galletas "
			echo -n "Nueva linea"
			echo $galletas > .cookies_save
			echo Guardado! 
			read -s aaa
			echo "Leido $aaa"
			let "galletas=galletas+$3"
			echo "+$3"
done

else
clear
echo
echo
echo "Cookie clicker V0.0.15" 
actual=015
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

# Eliminar delay no necesario

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
			echo -n "Galletas=$galletas "
			echo $galletas > .cookies_save #Sistema de guardado, se podria refinar con TRAP, para solo guardar a la salida, ETA NEVER, causa problemas al actualizar
			read -s aaa
			let "galletas=galletas+1"
			clear
done
fi
