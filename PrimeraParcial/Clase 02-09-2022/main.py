#Separacion con coma
numeroBig= 12123456789123456787
print(f"{numeroBig:,d}") #Se imprime con fstring el numero pero se separa el numero mediante un separador el cual es ,

# #Fijar con decimales
numeroPI= 3.1415926785478589658565 
print(f"{numeroPI: .3f}") #Se imprime con fstring la variable pero se utiliza la separacion(.) para asi decidir la cantidad de decimales que van a aparecer en la pantalla

# #Notacion cientifica
numeroPI= 314.15926785478589658565 
print(f"{numeroPI:e}") #Se imprime con fstring y con (e) el valor de la variable pero con valor en notacion cientifica
print(f"{numeroPI: .2e}") #Se imprime fstring y con (e) el valor de la variable pero con valor en notacion centifica y se utiliza la separacion(.) para asi contralar el numero de decimales

# #Porcentaje
numeroPorciento= 0.258478585 
print(f"{numeroPorciento:%}") #Se imprime con fstring el valor de la variable pero con el convertidor (%d) para asi mostrar el valor de la variable en porcentaje
print(f"{numeroPorciento:.2%}") #Se imprime con fstring el valor de la variable pero con el convertidor (%d) para asi mostrar el valor de la variable en porcentaje y con el separador(.) para contralar el numero de decimales

# #Numeros Binarios
print(f"{25:b}{35:b}") #Se imprime con fstring y con el formato (b) para convertir un numero entero a su equivalente en binario
# #Unicodes Codigo ASCII
print(f"{80:c}") #Se imprime con fstring y con el formato (c) para imprimir el valor de una cierta tecla pero con el codigo ASCII
# #Hexadecimal
print(f"{255:x}") #Se imprime con fstring y con el formato (x) para convertir un numero a su equivalente en hexadecimal
# #Octal
print(f"{255:o}") #Se imprime con fstring y con el formato (o) para convertir un numero a su equivalente en octal

#Escriba una funcion que genere una tabla de multiplicar
# recibiendo como argumento la cantidad de numero y la tabla
# a generar
def tablas_mult(m:int,n:int,fmt:int): #Se crea una funcion de apoyo la cual se encargara de generar las tablas que recibe como parametros el valor de las tablas, asi como el maximo de multiplicaciones y el formato de separacion entre cada elementos de las tablas. Todos los valores son de tipo integer(int)
   for i in range(1,m+1): #Se crea un ciclo for que se encarga de generar las tablas con un rango desde uno hasta el numero maximo de tablas mas 1
      tablas(n,i,fmt) #Se retorna una funcion que se encarga de imprimir las tablas, pasando como parametros, el valor maximo, el valor de las tablas y el formato de seaparacion de cada elementos de las tablas

def tablas(can_num:int, numero:int,fmt:int): #Se crea una funcion una funcion que se encargar de imprimir las tablas la cual recibe como parametros el valor de las tabla, asi como el maximo de multiplicaciones y el formato de separacion entre cada elementos de las tablas. Todos los valores son de tipo integer(int)
   print(f"tabla del {numero}") #Se muestra como titulo de cada tabla en pantalla el valor de la tabla de multiplicar
   for x in range(1,can_num+1): #Se crea un ciclo for que se encargara de recorrer cada elemento de las tablas que con un rango que inicia en 1 y termina hasta el valor maximo de tablas mas 1
      print(f"{numero:^{fmt}}x{x:^{fmt}} = {(x*numero):^{fmt}}") #Se imprime con fstring cada elemento de las tablas con formatos de separacion y al final hace la operacion de multiplicar para asi mostrar el resultado.
      # print("") #Se imprime un espacio en blanco al final de cada ciclo paraa asi separar una tabla de otra

if __name__=="__main__":
   tablas_mult(5,10,5) #Se manda a llamar la funcion que genera las tablas de multiplicar dando como parametros el numero el valor de las tablas, el numero maximo de multplicaiones y el formato de separacion entre cada elemento
