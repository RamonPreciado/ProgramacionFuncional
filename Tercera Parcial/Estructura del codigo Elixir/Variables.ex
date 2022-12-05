# >>> Inmutabilidad <<<
# – Los datos en Elixir son inmutables: su contenido no puede cambiarse.
# – Las variables pueden ser refijadas a un diferente valor
"""
iex()> dia_semana = 5 <se establece el valor inicial>
5
iex()> dia_semana <verificación>
5 <>
iex()> dia_semana = 7 <se refija el valor inicial>
7 <>
iex()> dia_semana <se verifica el efecto de la refijación>
7 <>
"""

# Variables
#>>> Elixir es un lenguaje de programación dinámico <<<
# – NO es necesario declarar de manera explícita una variable o su tipo de
# dato
# – El tipo de dato se determina de acuerdo al valor contenido
# – La asignación se conoce como fijación (binding)
# – Cuando se inicializa una variable con un valor, la variable se fija con ese
# valor.
"""
iex()> dia_semana = 7 <fija (binds) el valor>
7 <resultado de la última expresión>
iex()> dia_semana <expresion que retorna el valor de la variable>
7 <valor de la variable>
iex()> dia_semana * 2
14
"""
# >>> Características de las variables <<<
# – El nombre de una variable siempre inicia con un caracter alfabético en minúscula o caracter de subrayado (_)
# – Después puede llevar cualquier combinación de estos caracteres
# – La convención es usar solo letras, dígitos y subrayados
# – Pueden terminar con los carateres ? o !
# variable_valida
# esta_variable_tambien_es_valida
# esta_tambien_1
# estaEsValidaPeroNoRecomendada
# No_es_valida
# nombre_valido?
# claro_que_si!
