#!/bin/bash
#""""Cookie Clicker"""" version cutre en Bash, implementado:--- [X]=V3 Guardar/Restaurar // [ ELIMINADO (0.0.3) ] Niveles/Mas galletas por click llegados a cierto punto // [ ] Galletas automaticas // [ ] Actualizador (Si es que alguien quiere jugar a esto)

trap 'echo $galletas > .cookies_save ; exit' ERR EXIT

clear
echo
echo
echo "Cookie clicker V0.0.4" 
#Historial de versiones:
# 0.0.0: Primera prueba, agregar un sistema de guardado basico que determina una variable 0 o el contenido de un archivo oculto llamado .cookies_save
# 0.0.1: Poca cosa, el juego en si, un bucle while true y un read para hacer "clicks"
# 0.0.2: Arreglos generales, mejora al llegar a 250 galletas, no opcional (Por ahora)
# 0.0.3: Revertidos los cambios de la version 0.0.2, implementado un sistema de guardado mejorado.
#
echo
echo "----------------------"
echo "Escribe N para iniciar"
echo "una nueva partida o C"
echo "para cargar una que se"
echo "haya guardado antes"
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
			#CODIGO ELIMINADO:
			#		if [[ $click (Era el nombre de la variable que se usaba en el read que hay 7 lineas debajo) == "guardar" ]]
			#		then
			#		echo $galletas > .secreto_galletas
			#		else
			#		fi
			#Este codigo esta desactualizado y se elimino en la version 0.0.2
			#---echo $galletas > .cookies_save #Sistema de guardado, se podria refinar con TRAP, para solo guardar a la salida, ETA 0.1.0---### DEPRECADO ### Ahora 				se va a usar TRAP
			read -s
			let "galletas=galletas+1"
done



