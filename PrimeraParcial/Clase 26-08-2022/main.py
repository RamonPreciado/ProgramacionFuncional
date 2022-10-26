#Importar modulos desde otros archivos en una cierta carpeta
import ops.operaciones as op #Importar el modulo de una carpeta de operaciones con un punto(.) y (as) para hacer referencia al modulo.
import ops.sumar as s #Es una forma para solo importar un solo modulo de la carpeta
from ops.operaciones import multiplicar #Importar el modulo de operaciones, luego se importa el nombre del modulo y despues (import) y el nombre del archivo para asi obtener una funcion como si fuera nativa


if __name__ == "__main__":
   a = 11 
   b = 6 
   print(op.cuadrado(a)) #Se imprime el resultado de mandar a llamar la funcion importada 
   print(op.dividir(a,b))
   print(s.sumar(a,b))
   print(multiplicar(a,b))
