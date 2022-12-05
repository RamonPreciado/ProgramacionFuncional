# Binaries
# • Un binary es un grupo de bytes
# • cada numero representa un valor que corresponde a un byte
# • cualquier valor mayor a 255 se trunca al valor en byte
# """
iex(14)> <<1,2,3,4,5>>
<<1, 2, 3, 4, 5>>
iex> <<255>>
<<255>>
iex> <<256>>
<<0>>
iex> <<257>>
<<1>>
iex> <<512>>
<<0>>
"""
# Strings (Binary Strings)
# • No existe un tipo String dedicado
# • Los Strings se representan como binary o list
# • Lo más sencillo es usar dobles comillas
# """
iex> "Esto es un String"
"Esto es un String"
"""
# • Se pueden insertar expresiones en las cadenas (interpolación de cadenas)
# mediante #{}
# """
iex> "El cuadrado de 2 es #{2*2}"
"El cuadrado de 2 es 4"
"""
# • Secuencias de escape:
# – "
# – \"
# – \t
IO.puts("1. Este es un mensaje")
IO.puts("2. Este es un  \n mensaje")
IO.puts("3. Este es un \"mensaje\"")
IO.puts("4. Este es un \\mensaje\\")
IO.puts("5. Este \t es \tun \t mensaje")
IO.puts("4. Este
es un
mensaje")
# """
Salida
>elixir main.ex
1. Este es un mensaje
2. Este es un
 mensaje
3. Este es un "mensaje"
4. Este es un \mensaje\
5. Este es un mensaje
4. Este
 es un
 mensaje

"""
# • sigils
IO.puts(~s("este es un ejemplo de sigil" apuntes de Elixir))
IO.puts("Este \t es \tun \t mensaje")
IO.puts(~S("Este \t es \tun \t mensaje"))
"""
Salida
"este es un ejemplo de sigil" apuntes de Elixir
Este es un mensaje
"Este \t es \tun \t mensaje"
"""
# • Concatenación de Cadenas
defmodule Cadena do
  def concatenar(cad1, cad2, separador \\ " ") do
    cad1 <> separador <> cad2
  end
end
IO.puts(Cadena.concatenar("Hola", "Mundo"))
IO.puts(Cadena.concatenar("Hola", "Mundo", "<->"))
"""
Salida
>elixir main.ex
Hola Mundo
Hola<->Mundo
"""
# Pattern Matching
# • Operador pin: ^
# • Evita la refijación (rebind)
"""
iex> x = 3
3
iex> 3 = x
3
iex> 5 = x
** (MatchError) no match of right hand side value: 3
iex> x = 5
5
iex> x
5
iex> ^x = 5
5
iex> ^x = 10
** (MatchError) no match of right hand side value: 10
iex> 10 = x
** (MatchError) no match of right hand side value: 5
• Tuplas
iex> leer_archivo_ok = {:ok, "texto del archivo"}
{:ok, "texto del archivo"}
iex> leer_archivo_error = {:error, "No se pudo leer el archivo"}
{:error, "No se pudo leer el archivo"}
iex(8)> {:ok, respuesta} = leer_archivo_ok
{:ok, "texto del archivo"}
iex(9)> respuesta
"texto del archivo"
iex(10)> {:error, respuesta} = leer_archivo_error
{:error, "No se pudo leer el archivo"}
iex(11)> respuesta
"No se pudo leer el archivo"
"""
# • Ejemplo:
"""
iex> respuesta = {:ok, "texto del archivo"}
{:ok, "texto del archivo"}
iex> case respuesta do
...> {:ok, res} -> "Operacion exitosa: Contenido #{res}"
...> {:error, res} -> "Operacion fallida: #{res}"
...> _ -> "Valor por default"
...> end
"Operacion exitosa: Contenido texto del archivo"
iex> respuesta = {:error, "No se pudo leer el archivo"}
{:error, "No se pudo leer el archivo"}
iex> case respuesta do
...> {:ok, res} -> "Operacion exitosa: Contenido #{res}"
...> {:error, res} -> "Operacion fallida: #{res}"
...> _ -> "Valor por default"
...> end
"Operacion fallida: No se pudo leer el archivo"
"""
# • Listas
"""
iex> [head | tail] = [1,2,3,4]
[1, 2, 3, 4]
iex> head
1
iex> tail
[2, 3, 4]
iex> [head | _] = [1,2,3,4]
[1, 2, 3, 4]
iex> head
1
iex> [_ | tail] = [1,2,3,4]
[1, 2, 3, 4]
iex> tail
[2, 3, 4]
iex> mi_lista = [1,2,3,4]
[1, 2, 3, 4]
iex> [1,2,x,4] = mi_lista
[1, 2, 3, 4]
iex> x
3
"""
# • Funciones
defmodule Calculadora do
  def div(_,0) do
    {:error, "No se puede dividir por 0"}
  end
  def div(n1,n2) do
    {:ok, "El resultado es: #{n1/n2}"}
  end
end
IO.inspect(Calculadora.div(5,0))
IO.inspect(Calculadora.div(5,3))
"""
Salida
>elixir main.ex
{:error, "No se puede dividir por 0"}
{:ok, "El resultado es: 1.6666666666666667"}
"""
# • Si invertimos el orden de las funciones, es decir:
defmodule Calculadora do
  def div(n1, n2) do
    {:ok, "El resultado es: #{n1,n2}"}
  end
  def div(_,0) do
    {:error, "No se puede dividir por 0"}
  end
end
IO.inspect(Calculadora.div(5,0))
IO.inspect(Calculadora.div(5,3))
"""
Salida
>elixir main.ex
warning: this clause for div/2 cannot match because a previous clause at
line 2 always matches
 main.ex:5
** (ArithmeticError) bad argument in arithmetic expression
 main.ex:3: Calculadora.div/2
 main.ex:10: (file)
 (elixir 1.10.4) lib/code.ex:926: Code.require_file/2
"""
# Guardas
defmodule Numero do
  def cero?(0), do: true
  def cero?(n) when is_integer(n), do: false
  def cero?(_), do: "No es entero"
end
IO.puts(Numero.cero?(0))
IO.puts(Numero.cero?(2))
IO.puts(Numero.cero?("3"))
"""
Salida
>elixir main.ex
true
false
No es entero

"""
# Condicionales
# if
# • if, ejemplo 1

defmodule Persona1 do
  def sexo(sex) do
    if sex == :m do
      "Masculino"
    else
      "Femenino"
    end
  end
end
"""
Salida
iex> c("main.ex")
[Persona1]
iex> Persona1.sexo(:m)
"Masculino"
iex> Persona1.sexo(:f)
"Femenino"
iex> Persona1.sexo(:x)
"Femenino"
"""
# • if, ejemplo 2
defmodule Persona2 do
  def sexo(sex) do
    if sex == :m do
      "Masculino"
      else if sex == :f do
        femenino
      else
        "Sexo desconocido"
      end
    end
  end
end
"""
Salida
iex> c("main.ex")
[Persona2]
iex> Persona2.sexo(:m)
"Masculino"
iex> Persona2.sexo(:f)
"Femenino"
iex> Persona2.sexo(:x)
"Sexo desconocido"
"""
# case
# • case, ejemplo 1
defmodule Persona3 do
  def sexo(sex) do
    case sex do
      :m -> "Masculino"
      :f -> "Femenino"
      _ -> "Sexo desconocido"
    end
  end
end
"""
Salida
iex> c("main.ex")
[Persona3]
iex> Persona3.sexo(:m)
"Masculino"
iex> Persona3.sexo(:f)
"Femenino"
iex> Persona3.sexo(:x)
"Sexo desconocido"
"""
# • Match con funciones, ejemplo 1
defmodule Persona4 do
  def sexo(sex) when sex == :m do
    "Masculino"
  end
  def sexo(sex) when sex == :f do
    "Femenino"
  end
  def sexo(_sex) do
    "Sexo desconocido"
  end
end
"""
Salida
iex> c("main.ex")
[Persona4]
iex> Persona4.sexo(:m)
"Masculino"
iex> Persona4.sexo(:f)
"Femenino"
iex> Persona4.sexo(:x)
"sexo desconocido"
"""

# Match con funciones
# • Ejemplo 2
defmodule Persona5 do
  def sexo(sex) when sex == :m, do: "Masculino"
  def sexo(sex) when sex == :f, do: "Femenino"
  def sexo(_sex), do: "Sexo desconocido"
end

"""
Salida
iex> c("main.ex")
[Persona5]
iex> Persona5.sexo(:m)
"Masculino"
iex> Persona5.sexo(:f)
"Femenino"
iex> Persona5.sexo(:x)
"sexo desconocido"
"""

# cond
# • cond, ejemplo 1
defmodule Persona6 do
  def sexo(sex) do
    cond do
      sex == :m -> "Masculino"
      sex == :f -> "Femenino"
      true -> "Sexo desconocido"
    end
  end
end

"""
Salida
iex> c("main.ex")
[Persona6]
iex> Persona6.sexo(:m)
"Masculino"
iex> Persona6.sexo(:f)
"Femenino"
iex> Persona6.sexo(:x)
"Sexo desconocido"
"""

# Doctest
# • Se realiza a partir de la documentación de las funciones

@doc """"
Hello World
### Examples
    iex> Calculadora.hello()
    :world
"""

def hello do
  :world
end

# Test
# • Se realiza a partir del script del test
defmodule CalcualdoraTest do
  use ExUnit.Case
  doctest Calculadora

  test "Greets the world" do
    assert Calculadora.hello() == :world
  end
end

# case
# • Ejemplo 1
defmodule Matematicas do
  def calculadora(opcion, {n1,n2}) do
    case opcion do
      "+" -> n1+n2
      "-" -> n1-n2
      "/" -> when n2 != 0 -> n1/n2
      "/" -> when n2 == 0 -> "No se puede dividir por 0"
      "*" -> n1*n2
      _ -> :error
    end
  end
end

IO.inspect Matematicas.calculadora("+",{5,4})
IO.inspect Matematicas.calculadora("-",{5,4})
IO.inspect Matematicas.calculadora("/",{5,4})
IO.inspect Matematicas.calculadora("/",{5,0})
IO.inspect Matematicas.calculadora("*",{5,4})

"""
Salida
>elixir main.exs
9
1
1.25
"No se puede dividir por 0"
20
9
"""

# cond
# • Ejemplo 1
defmodule DiaSemana do
  def dia(d) do
    cond do
    d == 1 -> "Lunes"
    d == 2 -> "Martes"
    d == 3 -> "Miercoles"
    d == 4 -> "Jueves"
    d == 5 -> "Viernes"
    d == 6 -> "Sabado"
    d == 7 -> "Domingo"
    true -> "Dia no valido"
    end
  end
end

IO.puts DiaSemana.dia(1)
IO.puts DiaSemana.dia(2)
IO.puts DiaSemana.dia(3)
IO.puts DiaSemana.dia(4)
IO.puts DiaSemana.dia(5)
IO.puts DiaSemana.dia(6)
IO.puts DiaSemana.dia(7)
IO.puts DiaSemana.dia(8)

"""
Salida
>elixir main.ex
Lunes
Martes
Miercoles
Jueves
Viernes
Sabado
Domingo
El dia no es valido
"""

# cond
# • Ejemplo 2

defmodule DiaSemana do
  def dia(d) do
    cond do
      d == "l" or d == "L" -> "Lunes"
      d == "ma" or d == "MA" -> "Martes"
      d == "mi" or d == "MI" -> "Miercoles"
      d == "j" or d == "J" -> "Jueves"
      d == "v" or d == "V" -> "Viernes"
      d == "s" or d == "S" -> "Sabado"
      d == "d" or d == "D" -> "Domingo"
      true -> "Dia no valido"
    end
  end
end

IO.puts DiaSemana.dia("l")
IO.puts DiaSemana.dia("ma")
IO.puts DiaSemana.dia("mi")
IO.puts DiaSemana.dia("j")
IO.puts DiaSemana.dia("v")
IO.puts DiaSemana.dia("s")
IO.puts DiaSemana.dia("d")

IO.puts DiaSemana.dia("L")
IO.puts DiaSemana.dia("MA")
IO.puts DiaSemana.dia("MI")
IO.puts DiaSemana.dia("J")
IO.puts DiaSemana.dia("V")
IO.puts DiaSemana.dia("S")
IO.puts DiaSemana.dia("D")

IO.puts DiaSemana.dia("Ma")
IO.puts DiaSemana.dia("mA")

"""
Salida
>elixir main.ex
Lunes
Martes
Miercoles
Jueves
Viernes
Sabado
Domingo
Lunes
Martes
Miercoles
Jueves
Viernes
Sabado
Domingo
El dia no es valido
El dia no es valido
"""

# CALB
# cond
# • Ejemplo 3
defmodule DiaSemana do
  def dia(d) do
    d = String.upcase(d)
    cond do
      d == "L" -> "Lunes"
      d == "MA" -> "Martes"
      d == "MI" -> "Miercoles"
      d == "J" -> "Jueves"
      d == "V" -> "Viernes"
      d == "S" -> "Sabado"
      d == "D" -> "Domingo"
      true -> "Dia no valido"
    end
  end
end

IO.puts DiaSemana.dia("l")
IO.puts DiaSemana.dia("ma")
IO.puts DiaSemana.dia("mi")
IO.puts DiaSemana.dia("j")
IO.puts DiaSemana.dia("v")
IO.puts DiaSemana.dia("s")
IO.puts DiaSemana.dia("d")

IO.puts DiaSemana.dia("L")
IO.puts DiaSemana.dia("MA")
IO.puts DiaSemana.dia("MI")
IO.puts DiaSemana.dia("J")
IO.puts DiaSemana.dia("V")
IO.puts DiaSemana.dia("S")
IO.puts DiaSemana.dia("D")

IO.puts DiaSemana.dia("Ma")
IO.puts DiaSemana.dia("mA")

"""
Salida
>elixir main.ex
Lunes
Martes
Miercoles
Jueves
Viernes
Sabado
Domingo
Lunes
Martes
Miercoles
Jueves
Viernes
Sabado
Domingo
Martes
Martes
"""

# unless
# • Ejemplo 1
defmodule MayorDeEdad do
  def mayor1(edad) do
    unless edad >= 18 do
      "Es menor de edad"
    end
  end
end

"""
Salida
> c("main.ex")
[MayorDeEdad]
iex> MayorDeEdad.mayor(16)
"Es menor de edad"
iex> MayorDeEdad.mayor1(18)
nil
"""

# unless
# • Ejemplo 2
defmodule MayorDeEdad do
  def mayor1(edad) do
    unless edad >= 18 do
      "Es menor de edad"
    end
  end
end

"""
Salida
iex> c("main.ex")
[MayorDeEdad]
iex> MayorDeEdad.mayor1(16)
"Es menor de edad"
iex> MayorDeEdad.mayor2(16)
"Es menor de edad"
iex(61)> MayorDeEdad.mayor1(18)
nil
iex(62)> MayorDeEdad.mayor2(18)
nil
"""

# Funciones anónimas
# • No tienen nombre
# • Se pueden fijar a variables


# Ejemplos de funciones anónimas
# • Ejemplo 1
defmodule Calculadora do
  def suma(n1,n2), do: n1+n2
end
suma_anonima = fn(n1,n2) -> n1 + n2 end

IO.puts(Calculadora.suma(5,4))
IO.puts(Suma_anonima(5,5))

"""
Salida
>elixir main.ex
9
10
"""

# CALB
# Ejemplos de funciones anónimas
# • Ejemplo 2
mayor? = fn(n1,n2) -> if n1 > n2 do true else false end end

IO.inspect(mayor?.(4,5))
IO.inspect(mayor?.(5,4))
IO.inspect(mayor?.(5,5))

"""
• Salida
>elixir main.exs
false
true
false
"""

# • Ejemplo de función anónima
# • Si se desea personalizar la salida
mayor? = fn(n1,n2) -> if n1 > n2 do :si else :no end end

IO.inspect(mayor?.(4,5))
IO.inspect(mayor?.(5,4))

"""
Salida
>elixir main.exs
:no
:si
"""

# Ejemplos de funciones anónimas
# • Ejemplo 3
mayor? = fn(n1,n2) -> if n1 > n2 do: si else :no end end
res = mayor?.(4,5)
IO.puts res
res = mayor?.(5,4)
IO.puts res

"""
Salida
>elixir main.exs
no
si
"""

# Ejemplos de funciones anónimas
# • Ejemplo 4
# Cristian Armando Larios Bravo
mayor = fn(n1,n2) ->
  if n1 > n2 do
    {:ok, "#{n1} > #{n2}"}
  else
    {:error, "#{n1} <= #{n2}"}
  end
end

IO.inspect(mayor?.(4,5))
IO.inspect(mayor?.(5,4))
IO.inspect(mayor?.(5,5))

"""
Salida
>elixir main.exs
{:error, "4 <= 5"}
{:ok, "5 > 4"}
{:error, "5 <= 5"}
"""

# Ejemplos de funciones anónimas
# • Ejemplo 5
mayor = fn(n1,n2) ->
  if n1 > n2 do
    {:ok, "#{n1} > #{n2}"}
  else
    {:error, "#{n1} <= #{n2}"}
  end
end

{status, res} = mayor.(4,5)
IO.puts status
IO.puts res
{status, res} = mayor.(5,4)
IO.puts status
IO.puts res

"""
Salida
>elixir main.exs
error
4 <= 5
ok
5 > 4
"""

# Operador Pipe
# • Dada una lista con n numeros, se desea obtener el cuadrado de la suma de los
# elementos de la cola. Si la lista es [1,2,3,4,5], el resultado es (2+3+4+5)^2
# • csc = cuadrado(suma(2,3,4,5))

sum = 0
lista = [1,2,3,4,5]
lista = tl(lista)
IO.inspect(lista)
[num|lista] = lista
# Para sacar el 2
IO.inspect(num)
IO.inspect(lista)
sum = sum + num
IO.inspect(num)
# Para sacar el 3
[num|lista] = lista
IO.inspect(num)
IO.inspect(lista)
sum = sum + num
IO.inspect(sum)
# Para sacar el 4
[num|lista] = lista
IO.inspect(num)
IO.inspect(lista)
sum = sum + num
IO.inspect(sum)
# Para sacar el 5
[num|lista] = lista
IO.inspect(num)
IO.inspect(lista)
sum = sum + num
IO.inspect(sum)
IO.puts("El resultado es: #{sum*sum}")

"""
Salida
>elixir main.ex
[2, 3, 4, 5]
2
[3, 4, 5]
2
3
[4, 5]
5
4
[5]
9
5
[]
14
EL resultado es: 196
"""

# • Solución 1
defmodule PipeTest do
  def cuadrado(n), do: n*n

  def suma(lista) do
    Enum.sum(lista)
  end
end

IO.puts("#{PipeTest.cuadrado(PipeTest.suma(tl([,1.2.3.4.5])))}")

"""
>elixir main.ex
196
"""

# • Solución 2
defmodule PipeTest do
  def cuadrado(n), do: n*n

  def suma(lista) do
    Enum.sum(lista)
  end

  def csc(lista) do
    lista
    |> tl
    |> suma
    |> cuadrado
  end
end

IO.puts("#{PipeTest.csc([1,2,3,4,5])}")

"""
Salida
>elixir main.ex
196
"""

# • Herramienta de depuración (debugging)
defmodule PipeTest do
  def cuadrado(n), do: n*n

  def suma(lista) do
    Enum.sum(lista)
  end

  def csc(lista) do
    lista
    |> tl
    |> IO.inspect
    |> suma
    |> IO.inspect
    |> cuadrado
  end
end

IO.puts("#{PipeTest.csc([1,2,3,4,5])}")

"""
Salida
>elixir main.ex
[2, 3, 4, 5]
14
196
"""

# Loops y recursión
# Rangos (range)
# • Representan una secuencia de números
# • Se definen con un límite inferior y un límite superior
# • Son inclusivos
# • Se separan con dos puntos (..)
# • Son equivalentes a una lista:
# – 1..10 -> [1,2,3,4,5,6,7,8,9,10]
# • Es más eficiente que una lista de números secuenciales, puesto que solo se
# almacenan dos enteros, el del inicio y el del final
# • Son enumerables, cada número se genera conforme se itere sobre el rango
# • La función Enum puede usarse con rangos
# • Ejemplo:
"""
iex> 1..01
1..1
iex> 1..10
1..10
iex> li..ls = 1..10
1..10
iex> li
1
iex> ls
10
iex> li = 10
10
iex> ls = 20
20
iex> li..ls
10..20
iex> ls..li
20..10
"""
# • Se puede generar una lista a partir de un rango
"""
iex> Enum.to_list(10..1)
[10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
"""
# • Contar cuantos elementos hay en el rango
"""
iex> rango = 10..25
10..25
iex> Enum.count(rango)
16
"""
# • Determinar si un elemento x se encuentra dentro del rango
"""
iex> rango = 10..25
10..25
iex> Enum.member?(rango,9)
false
iex> Enum.member?(rango,20)
true
"""
# • otra forma de saberlo es con el operador in
"""
iex> 9 in rango
false
iex> 20 in rango
true
"""


# • Funciones de Enum
# EmptyError OutOfBoundsError all?/1
# all?/2 any?/1 any?/2
# at/2 at/3 chunk_by/2
# chunk_every/2 chunk_every/3 chunk_every/4
# chunk_while/4 concat/1 concat/2
# count/1 count/2 dedup/1
# dedup_by/2 drop/2 drop_every/2
# drop_while/2 each/2 empty?/1
# fetch!/2 fetch/2 filter/2
# find/2 find/3 find_index/2
# find_value/2 find_value/3 flat_map/2
# flat_map_reduce/3 frequencies/1 frequencies_by/2
# group_by/2 group_by/3 intersperse/2
# into/2 into/3 join/1
# join/2 map/2 map_every/3
# map_intersperse/3 map_join/2 map_join/3
# map_reduce/3 max/1 max/3
# max_by/2 max_by/4 member?/2
# min/1 min/3 min_by/2
# min_by/4 min_max/1 min_max/2
# min_max_by/2 min_max_by/3 random/1
# reduce/2 reduce/3 reduce_while/3
# reject/2 reverse/1 reverse/2
# reverse_slice/3 scan/2 scan/3
# shuffle/1 slice/2 slice/3
# sort/1 sort/2 sort_by/2
# sort_by/3 split/2 split_while/2
# split_with/2 sum/1 take/2
# take_every/2 take_random/2 take_while/2
# to_list/1 uniq/1 uniq_by/2
# unzip/1 with_index/1 with_index/2
# zip/1 zip/2

# Cristian Larios
# for
# • Ejemplo 1
# • Contar del 1 al 10
for x <- 1..10 do
  IO.puts(x)
end

"""
Salida
>elixir main.exs
1
2
3
4
5
6
7
8
9
10
"""

# • Ejemplo 2
# • Sumar todos los números entre 1 y 10
sum = 0
for x <- 1..10 do
  sum = sum + x
end
IO.inspect(sum)

"""
Salida
>elixir main.exs
warning: variable "sum" is unused (if the variable is not meant to be use
d, prefix it with an underscore)
 main.exs:4
warning: the result of the expression is ignored (suppress the warning by
assigning the expression to the _ variable)
 main.exs:4
0
"""

# • Quitando sum para evitar los warnings
for x <- 1..10 do
  sum = sum + x
end
IO.inspect(sum)

"""
Salida
>elixir main.exs
warning: variable "sum" does not exist and is being expanded to "sum()",
please use parentheses to remove the ambiguity or change the variable nam
e
 main.exs:2
** (CompileError) main.exs:2: undefined function sum/0
 (stdlib 3.13) lists.erl:1354: :lists.mapfoldl/3
"""

# • Asignando el for a la variable sum
# • Eliminando el acumulador dentro del for

sum = for x <- 1..10 do
  x
end
IO.inspect(sum)

"""
Salida
>elixir main.exs
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
"""

# • Al saber que lo que genera es una lista, se puede utilizar la función sum del
# módulo Enum
sum = for x <- 1..10 do
  x
end
IO.puts Enum.sum(sum)

"""
Salida
>elixir main.exs
55
"""

# • Se puede expresar en una sola línea de código:
IO.puts Enum.sum(1..10)

"""
Salida
>elixir main.exs
55
"""

# Hacer un programa recursivo que imprima n veces un mensaje
defmodule Repetir do
  def imprimir(msg, n) when n <= 1 do
    IO.puts("#{n}: #{msg}")
  end

  def imprimir(msg, n) do
    IO.puts("#{n}: #{msg}")
    imprimir(msg, n-1)
  end
end

Repetir.imprimir("Hola", 10)

"""
Salida
>elixir main.exs
10: Hola
9: Hola
8: Hola
7: Hola
6: Hola
5: Hola
4: Hola
3: Hola
2: Hola
1: Hola
"""

# Invertir el orden de los números
defmodule Repetir do
  def imprimir(msg, n ls) when n >= ls do
    IO.puts("#{n}: #{msg}")
  end

  def imprimir(msg, n, ls) do
    IO.puts("#{n}: #{msg}")
    imprimir(msg, n+1, ls)
  end
end

Repetir.imprimir("Hola", 1, 10)

"""
Salida
>elixir main.exs
1: Hola
2: Hola
3: Hola
4: Hola
5: Hola
6: Hola
7: Hola
8: Hola
9: Hola
10: Hola
"""

# Escribir un programa recursivo que sume todos los elementos de una serie
# de números en una lista

defmodule Matematicas do
  def sum_list([], suma), do: suma
  def sum_list([head | tail], suma) do
    sum_list(tail, suma + head)
  end
end

IO.puts(Matematicas.sum_list([1,2,3,4,5,6,7,8,9,10], 0))
IO.puts(Matematicas.sum_list([1,3,5,7,9,10,15], 0))

"""
Salida
>elixir main.exs
55
50
"""



# Obtener el promedio de 10 calificaciones entre 0 y 10 almacenadas en una
# lista

defmodule Matematicas do
  def sum_list([], suma), do: suma
  def sum_list([head | tail], suma) do
    sum_list(tail, suma + head)
  end
end

IO.puts(Matematicas.sum_list([10,5,9,9,8,5,7,9,6,5],0) / 10)

""""
Salida
>elixir main.exs
7.3
"""

# Calcular el promedio de n calificaciones entre 0 y 10 en una lista
defmodule Matematicas do
  def sum_list([], suma), do: suma
  def sum_list([head | tail], suma) do
    sum_list(tail, suma + head)
  end
  def promedio(calificaciones) do
    sum_list(calificaciones, 0) / Enum.count(calificaciones)
  end
end

IO.puts(Matematicas.promedio([10,5,9,9,8,7,9,6,5]))

""""
Salida
>elixir main.exs
7.3
"""

# La forma más sencilla es mediante el módulo Enum
calificaciones = [10,5,9,9,8,7,9,6,5]
IO.puts Enum.sum(calificaciones) / Enum.count(calificaciones)

"""
Salida
>elixir main.exs
7.3
"""

# Generar n calificaciones aleatorias entre 0 y 10 y obtener su promedio
max = 50
calificaciones = for _x <- 1..max do
  Enum.random(0..10)
end
IO.inspect(calificaciones)
IO.puts Enum.count(calificaciones)
IO.puts Enum.sum(calificaciones) / Enum.count(calificaciones)

"""
Salida
>elixir main.exs
[9, 0, 9, 5, 4, 2, 8, 0, 3, 6, 6, 1, 7, 6, 9, 3, 10, 10, 2, 6, 2, 4, 8, 5
, 2, 6,
 7, 6, 5, 0, 8, 10, 7, 7, 10, 4, 0, 6, 0, 9, 4, 6, 10, 0, 8, 2, 6, 10, 8,
0]
50
5.32
"""

# Escriba el problema anterior con un módulo y una función, recibiendo como
# argumentos la cantidad de calificaciones a generar, así como el rango de
# calificaciones.
defmodule Estadistica do
  def promedio(max_cal, _li, _ls) when max_cal <= 1 do
    :error
  end
  def promedio(max_cal, li, ls) when max_cal > 1 do
    calificaciones = for _x <- 1..max_cal do
      Enum.random(li..ls)
    end
    Enum.sum(calificaciones) / Enum.count(calificaciones)
  end
end

IO.puts Estadistica.promedio(50, 1, 15)
IO.puts Estadistica.promedio(-5, 1, 15)

"""
Salida
>elixir main.exs
8.6
error
"""

# Hacer un programa recursivo que cuente de manera creciente de li (límite
# inferior) a ls (límite superior) para li>=ls inclusive
defmodule For_range do
  def for_to(n, ls) when n > ls do
    IO.puts "error"
  end
  def for_to(n, ls) when n >= ls do
    IO.puts n
  end
  def for_to(n, ls) do
    IO.puts n
    for_to(n + 1, ls)
  end
end
IO.puts("Contar de 1 a 10")
For_range.for_to(1, 10)

IO.puts("Contar de 12 a 5")
For_range.for_to(12, 5)

"""
Salida
>elixir main.exs
Contar de 1 a 10
1
2
3
4
5
6
7
8
9
10
Contar de 12 a 5
error
"""

# Programa que sume los valores de los números consecutivos entre li y ls
# inclusive
defmodule For_range do
  def for_to(n, ls) when n >= ls do
    n
  end

  def for_to(m, ls) do
    n + for_to(n + 1, ls)
  end
end
IO.puts("Suma de los numeros de 1 a 10")
IO.puts For_range.for_to(1,10)

IO.puts("Suma de los numeros 5 a 12")
IO.puts For_range.for_to(5,12)

"""
Salida
>elixir main.exs
suma de los numeros de 1 a 10
55
suma de los numeros 5 a 12
68
"""
