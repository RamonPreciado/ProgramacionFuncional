# >>> Módulos <<<
# Un módulo consta de varias funciones
# Cada función debe estar definida dentro de un módulo
# El módulo IO permite varias operaciones de E/S (I/O), la función puts permite
# imprimir un mensaje en pantalla
"""
iex()> IO.puts("Hola Mundo")
Hola Mundo
:ok
"""

# La sintaxis general es:
# – NombreModulo.nombre_funcion(args)
# Se utiliza el constructor defmodule para la creación de los módulos
# Dentro del módulo con el constructor def se crean las funciones.


# >>> Funciones <<<
# Una función siempre debe estar dentro de un módulo
# Los nombres de funciones son igual que las variables:
# – El nombre de una variable siempre inicia con un caracter alfabético en
# minúscula o caracter de subrayado (_)
# – Después puede llevar cualquier combinación de estos caracteres
# – La convención es usar solo letras, dígitos y subrayados
# – Pueden terminar con los carateres ? o !.
# – Por convención el ? se utiliza cuando la función retorna true o false
# – El ! se utiliza generalmente en funciones que podrían provocar algún error
# en tiempo de ejecución
# – Tanto defmodule como def NO son palabras reservadas del lenguaje, son
# macros

# >>> Función sin argumentos <<<
defmodule HolaMundo do
  def mensaje do
    IO.puts("Hola Mundo")
  end
end

"""
Salida
iex()> HolaMundo.mensaje
Hola Mundo
:ok
"""

# >>> Función con argumentos <<<
defmodule Calculadora do
  def suma(n1,n2) do
    n1 + n2
  end
end

"""
Salida
C:\>iex modulo01.ex
Interactive Elixir (1.10.4) - press Ctrl+C to exit (type h() ENTER for he
lp)
iex(1)> Calculadora.suma(4,5)
9
"""

# Un módulo puede estar dentro de un archivo. Un archivo puede contener varios
# módulos.

defmodule Areas do
  def area_cuadrado(1) do
    1*1
  end
end

"""
Salida
iex()> c("modulo01.ex")
warning: redefining module Calculadora (current version defined in memory
)
modulo01.ex:1
[Areas, Calculadora]
iex()> Areas.area_cuadrado(4)
16
iex()> Calculadora.suma(5,5)
10
"""

# Reglas de los módulos
# – Inicia con una letra mayúscula
# – Se escribe con el estilo CamelCase
# – Puede consistir en caracteres alfanuméricos, subrayados y puntos (.).
# Regularmente se usa para la organización jerárquica de los módulos.

defmodule Geometria.Cuadrado do
  def perimetro(l) do
    4*l
  end
end

defmodule Geometria.Rectangulo do
  def perimetro(l1,l2) do
    2*l1 + 2*l2
  end
end

"""
Salida
iex()> c("modulo01.ex")
[Geometria.Cuadrado, Geometria.Rectangulo]
iex()> Geometria.Cuadrado.perimetro(4)
16
iex()> Geometria.Rectangulo.perimetro(4,2)
12
"""

# También se pueden anidar de la siguiente forma:
defmodule Geometria do
  defmodule Cuadrado do
    def perimetro(l) do
      4*l
    end
  end

  defmodule Rectangulo do
    def perimetro(l1,l2) do
      2*l1 + 2*l2
    end
  end
end

"""
Salida
iex(7)> c("modulo01.ex")
warning: redefining module Geometria.Cuadrado (current version defined in
memory)
 modulo01.ex:2
warning: redefining module Geometria.Rectangulo (current version defined
in memory)
 modulo01.ex:7
[Geometria, Geometria.Cuadrado, Geometria.Rectangulo]
iex(8)> Geometria.Cuadrado.perimetro(4)
16
iex(9)> Geometria.Rectangulo.perimetro(4,2)
12
"""

# Las funciones pueden expresarse de manera condensada
defmodule Geometria do
  def perimetro_cuadrado(l), do: 4*l
  def perimetro_rectangulo(l1,l2), do: 2*l1 + 2*l2
end

"""
Salida
iex()> c("modulo01.ex")
[Geometria]
iex()> Geometria.perimetro_cuadrado(4)
16
iex()> Geometria.perimetro_rectangulo(4,3)
14
"""

# Los paréntesis en los argumentos son opcionales
"""
Salida
iex()> Geometria.perimetro_cuadrado 4
16
iex()> Geometria.perimetro_rectangulo 4,3
14
"""

# Los paréntesis en los argumentos son opcionales
# Invocaciones internas de una función no requieren del prefijo del nombre del
# módulo.

defmodule Geometria do
  def perimetro1(l), do: cuadrado(l)
  def perimetro2(l), do: Geometria.cuadrado(l)
  def cuadrado(l), do: 4*l
end

"""
Salida
iex()> c("modulo01.ex")
[Geometria]
iex()> Geometria.perimetro1(4)
16
iex()> Geometria.perimetro2(4)
16
iex()> Geometria.cuadrado(4)
16
"""

# Visibilidad de funciones
# Se pueden utilizar funciones privadas con el constructor defp
# Función Publica y privada

defmodule TestPublicoPrivado do
  def funcion_publica(msg) do
    IO.puts("#{msg} publico")
    funcion_privada(msg)
  end

  defp funcion_privada(msg) do
    IO.puts("#{msg} privado")
  end
end

TestPublicoPrivado.funcion_publica("Este es un mensaje")

"""
Salida
iex> c("modulo01.ex")
este es un mensaje publico
este es un mensaje privado
[TestPublicoPrivado]
"""

# Módulo Geometría
defmodule Geometria do
  def perimetro1(l), do: cuadrado(l)
  def perimetro2(l), do: Geometria.cuadrado(l)
  defp cuadrado(l), do: 4*l
end

"""
Salida
iex()> c("modulo01.ex")
[Geometria]
iex()> Geometria.perimetro1(4)
16
iex()> Geometria.perimetro2(4)
** (UndefinedFunctionError) function Geometria.cuadrado/1 is undefined or
private
 Geometria.cuadrado(4)
iex()> Geometria.cuadrado(4)
** (UndefinedFunctionError) function Geometria.cuadrado/1 is undefined or
private
 Geometria.cuadrado(4)
"""

# Operador pipeline
"""
iex()> 4 |> Geometria.perimetro1
16
"""

# Dado el siguiente programa: Código fuente
# defmodule Operaciones do
#  def suma(n1,n2), do: n1 + n2
#  def cuadrado(n), do: n * n
# end
# Obtener el cuadrado de la suma de 2 números (4 y 5)
defmodule Operaciones do
  def suma(n1, n2), do: n1 + n2
  def cuadrado(n), do: n * n
end

# Invocando las funciones
"""
iex()> Operaciones.cuadrado(Operaciones.suma(4,5))
81
"""

# Utilizando pipelines
"""
iex()> 4 |> Operaciones.suma(5) |> Operaciones.cuadrado
  81
  iex()> Operaciones.suma(4,5) |> Operaciones.cuadrado
  81
"""

# Mediante un módulo test que realice las pruebas se podría realizar de la siguiente
# forma:
defmodule Operaciones do
  def suma(m1,n1), do: n1 + n2
  def cuadrado(n), do: n * n
end

defmodule Test do
  def start do
    4 |> Operaciones.suma(5) |>Operaciones.cuadrado
  end
end

"""
Salida
iex()> c("modulo01.ex")
[Operaciones, Test]
iex()> Test.start
81
"""

# Aridad (Arity) de funciones
# Es el nombre para el número de argumentos que una función recibe
# Una función se identifica por:
# 1. el módulo donde se encuentra,
# 2. su nombre y
# 3. su aridad (arity)


# Polimorfismo (sobrecarga)
# Dos funciones con el mismo nombre pero con diferente aridad son dos diferentes
# funciones.
# Cristian Armando Larios Bravo

defmodule Rectangulo do
  def area(1) do
    1 *1
  end
  def area(l1,l2) do
    l1 * l2
  end
end

"""
Salida
iex()> c("modulo01.ex")
[Rectangulo]
iex()> Rectangulo.area(4)
16
iex()> Rectangulo.area(4,5)
20
"""

# Haciendo que una función dependa de otra de diferente aridad, se podría realizar
# lo siguiente:
defmodule Calculadora do
  def suma(n) do
    suma(n, 0)
  end
  def suma(n1,n2) do
    n1 + n2
  end
end

"""
Salida:
iex()> c("modulo01.ex")
[Calculadora]
iex()> Calculadora.suma(4)
4
iex()> Calculadora.suma(4,5)
9
"""

# Argumentos por defecto
# Se pueden especificar argumentos por defecto mediante el operador
defmodule Calculadora do
  def suma(n1,n2 \\ 0) do
    n1 + n2
  end
end
# Este módulo genera dos funciones como en el caso anterior
"""
Salida
iex()> c("modulo01.ex")
[Calculadora]
iex()> Calculadora.suma(7)
7
iex()> Calculadora.suma(7,10)
17
"""
# Se puede utilizar cualquier combinación de argumentos por defecto:
defmodule Calculadora do
  def funcion(n1,n2 \\ 0, n3 \\ 1, n4, n5 \\ 2) do
    n1 + n2 + n3 + n4 + n5
  end
end

"""
Salida
iex()> c("modulo01.ex")
[Calculadora]
iex()> Calculadora.funcion(4)
** (UndefinedFunctionError) function Calculadora.funcion/1 is undefined o
r private. Did you mean one of:
 * funcion/2
 * funcion/3
 * funcion/4
 * funcion/5
 Calculadora.funcion(4)
iex()> Calculadora.funcion(4,5)
12
iex()> Calculadora.funcion(4,5,6)
18
iex()> Calculadora.funcion(4,5,6,7)
24
iex()> Calculadora.funcion(4,5,6,7,8)
30
iex()> Calculadora.funcion(4,5,6,7,8,9)
** (UndefinedFunctionError) function Calculadora.funcion/6 is undefined o
r private. Did you mean one of:
* funcion/2
* funcion/3
* funcion/4
* funcion/5
Calculadora.funcion(4, 5, 6, 7, 8, 9)
iex()>
"""

# Atributos de módulo
# Existen los atributos en tiempo de compilación (Mientras están cargados)
defmodule Geometria do
  @pi 3.141592
  def area(r) do
    r*r*@pi
  end
  def circunferencia(r) do
    2 * r * @pi
  end
end

"""
Salida
iex> c("main.ex")
[Geometria]
iex> alias Geometria, as: G
Geometria
iex> G.area(4)
50.265472
iex> G.circunferencia(4)
25.132736
"""

# Elixir permite el registro de atributos, que se almacenarán en el archivo binario.
# – @moduledoc
# – @doc
# Sirven para documentar módulos y funciones

defmodule Geometria do
  @moduledoc  "Calcula el area y el perimetro de un circulo"

  @pi 3.141692

  @doc  "Calcula el area del circulo"
  def area(r), do: r*r*@pi

  @doc  "Calcula el perimetro de un circulo"
  def circunferencia(r), do: 2 * r * @pi
end

# Para comprobar su uso, compilamos en la terminal el código fuente:
# – C:>elixirc main.ex
# Esto va a generar el archivo:
# – Elixir.Geometria.beam
# abrimos iex y verificamos la documentación:
"""
iex> Code.fetch_docs(Geometria)
{:docs_v1, 2, :elixir, "text/markdown",
 %{"en" => "Calcula el area y el perimetro de un circulo"}, %{},
 [
 {{:function, :area, 1}, 6, ["area(r)"],
 %{"en" => "calcula el area del circulo"}, %{}},
 {{:function, :circunferencia, 1}, 9, ["circunferencia(r)"],
 %{"en" => "calcula el perimetro de un circulo"}, %{}}
 ]}
iex> h Geometria
* Geometria
Calcula el area y el perimetro de un circulo
iex> h Geometria.area
* def area(r)
calcula el area del circulo
iex> h Geometria.circunferencia
* def circunferencia(r)
calcula el perimetro de un circulo
iex(6)>
"""
