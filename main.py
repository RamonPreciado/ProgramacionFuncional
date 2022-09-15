# Funcion que reciba un mensaje y un nombre e imprima en pantalla "<mensaje> <nombre>"
def saludar(mensaje:str, nombre:str)->str: # Se pasan los argumentos <mensaje> y <nombre> de tipo string
   print(f"{mensaje} {nombre}")

# Funcion que reciba el nombre y edad de una persona e imprima en pantalla "Hola <nombre> tienes <edad> años"
def mensaje(nombre:str, edad:int)->str: # Se pasan los argumentos <nombre> de tipo string y <edad> de tipo int
   print("Hola", (nombre), "tienes", (edad), "años")

#3._ Escribir una funcion que recibe el año actual y el año de nacimiento, usando la funcion anterior
# enviando esta como argumento obtenga el mensaje: "Hola <nombre> tienes <edad> años
def calcular_edad(año_actual:int, año_nacimiento:int, nombre:str)->str: # Se pasan los argumentos <año_actual>, <año_nacimiento> de tipo int y <nombre> de tipo str
   edad = año_actual - año_nacimiento
   return mensaje(nombre,edad) #Llamado de la funcion calcular_edad como parametro de la funcion calcular_edad


if __name__ == "__main__":
   print("Escibir una funcion que reciba un mensaje y un nombre y escriba en pantalla <mensaje> <nombre>")
   saludar("Hola","Ramon")
   print("Escribir una funcion que reciba el nombre y la edad de una persona. El mensaje de salida tiene que ser: Hola <nombre> tienes <edad> años")
   mensaje("Victor", "20")
   print("Escribir una funcion que recibe el año actual y el año de nacimiento, usando la funcion anterior enviando esta como argumento obtenga el mensaje: Hola <nombre> tienes <edad> años")
   calcular_edad(2022,2002,"Ramon")