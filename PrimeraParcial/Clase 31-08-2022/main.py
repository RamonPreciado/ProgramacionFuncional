#listas
alumnos=["Hugo", "Paco", "Luis", "Lupita"] #Crear lista con datos str
print(f"Alumnos: {alumnos}") #Imprimir lista completa

#Tuplas
alumnos= ("Hugo", "Paco", "Luis", "Lupita") #Crear tupla
print(f"Alumnos: {alumnos}") 

#sets
alumnos= {"Hugo", "Paco", "Luis", "Lupita"} #Crear sets
print(f"Alumnos: {alumnos}") 

#diccionarios
alumnos = {"nombre":"Hugo", "Materia1":10, "Materia2":5} #Crear diccionario. claves(nombre, Materia1, Materia2), valores(hugo, 10, 5) 
print(f"alumnos: {alumnos}") 
print(f"alumnos: {alumnos['Materia1']}") #Imprime del diccionario el valor que tiene por clave Materia1

#Diferencia entre lista y set
numeros_list = [1,2,1,2,4,3,4,3,2,2,1,4,6,5,5,2,1,5] #Se crea una lista de numeros de tipo entero. 
numeros_set = {1,2,1,2,4,3,4,3,2,2,1,5,6,5,5,2,4,5} #Se crea un Set con numero de tipo entero de forma repetitiva
print(numeros_list) #Imprimir lista completa
print(numeros_set) #Imprimir set completo

#Mini base de datos
e = ["Nombre", "Est Dat", "Prog Func", "Ingles"] #Cabeceras de la tabla
alumnos=["Hugo Alberto", "Paco", "Luis", "Lupita"] #Datos de la columna <Nombre>
m_e_d = [9,7,9,8] #Datos de la columna <Est Dat>
m_p_f = [10.5,8.34,7.92,9.11] #Datos de la columna <Prog Func>
m_i = [6,9,7,10] #Datos de la columna <Ingles>

ancho=15 #Se le asigna el valor de separacion entre elementos a una variable que se encarge de acomodar de la mejor forma los elementos
print(f"{e[0]:^{ancho}}{e[1]:^{ancho}}{e[2]:^{ancho}}{e[3]:^{ancho}}") #Se imprime mediante fstring nuestra pequeña base de datos, se utiliza la variable de separacion para hacer mas estetica la base de datos
for i in range(len(alumnos)): #Se recorre la lista de alumnos para ingresar a cada elemento de ella}
   print(f"{alumnos[i]:<{ancho}}{m_e_d[i]:^{ancho}}{m_p_f[i]:^{ancho}}{m_i[i]:^{ancho}}") #Se asigna mediante fstring el valor de la calificacion a cada alumno y al final se imprime la base de datos
