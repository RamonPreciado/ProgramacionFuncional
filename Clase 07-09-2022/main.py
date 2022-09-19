lista1 = [1, 2, 3, 4]   # Crear lista con elementos del mismo tipo
print(lista1)   # Imprimir lista

lista2 = [1, 3.14, "a", True, [1,2,3], (1, 2, 3), {8, "a", 5.4}]        # Una lista puede contener cualquier tipo de dato
print(lista2)

print(len(lista1))  # Imprimir la longitud de la lista

print(len(lista2))
print(lista2[6])    # Acceder a un elemento de la lista mediante su indice

lista_cal = []  # Crear lista vacia
print(lista_cal)
lista_cal.append(5)     # Agregar un elemento al final de la lista
print(lista_cal)   
lista_cal.append(8)
print(lista_cal)
lista_cal.insert(0,6)   # Modificar el elemento del indice 0
lista_cal.append(5)
print(lista_cal)

# Rellenar una lista con los numeros naturales del 1 al 10

lista6 = []

for i in range(1,11):
    lista6.append(i)

print(lista6)

# Imprimir un elemento de la lista al reves con indices negativos
print(lista1[-4])

# Slices
lista1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(lista1)
print(lista1[:])    # Imprime todos los elementos de la lista
print(lista1[0:10]) # Imprime los elementos del indice 0 al 10-1 (1 al 8)
print(lista1[int(len(lista1)/2):])  # Imprime los elementos del indice resultante de dividir la longitud entre 2, hasta el ultimo indice
print(lista1[:int(len(lista1)/2)])  # Imprime los elementos del indice 0 hasta el indice resultante de dividir la longitud entre 2
print(lista1[0:-1]) # Imprime todos los elementos de la lista
print(lista1[3:7]) 
print(lista1[-7:-3])


lista1 = [1, "dos", 3, "cuatro"]
lista2 = lista1 # Duplicar contenido de la lista

print(f"Lista 1: {lista1}")
print(f"Lista 1: {lista2}")
print()
print(f"Direccion lista1: {id(lista1)}")
print(f"Direccion lista2: {id(lista2)}")
print()
# lista1[1] = 2
# lista1[3] = 4

print(f"Lista 1: {lista1}")
lista2 = lista1[:]
lista2[1] = 2
lista2[3] = 4 
print(f"Lista 2: {lista2}")
print("")
print(f"Direccion lista1: {id(lista1)}")
print(f"Direccion lista1: {id(lista2)}")


lista1 = [0,1,2,3,4]
lista2 = [5,6,7]
# lista1[5:] = lista2
# lista1.extend([5,6,7])
#lista1[len(lista1):] = lista2
""" 
for i in range(5,8):
    lista1.append(i)
 """
 # Insertar al inicio de la lista varios elementos (en una lista)
# lista1[:0] = lista2
# print(lista1)

# lista1.append(lista2)
lista1.extend(lista2)
print(lista1)

# del(lista1[0])  # Eliminar la lista1 indice 0
del lista1[0]  # Eliminar la lista1 indice 0
print(lista1)
del(lista1[2:5])
print(lista1)
