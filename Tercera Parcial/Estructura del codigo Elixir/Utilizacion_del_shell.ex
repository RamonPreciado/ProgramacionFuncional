# >>> Cargar en la terminal el Shell (iex) <<<
"""
C:\>iex
Interactive Elixir (1.10.4) - press Ctrl+C to exit (type h() ENTER for he
lp)
iex()>
"""

# >>> Realizar expresiones que se evaluan al presionar (enter) <<<
"""
iex()> 5 + 4<enter>
9
iex()> 5 +<enter>
...()> 4<enter>
9<enter>
"""

# >>> Escribir múltiples expresiones, retornando siempre el último valor <<<
"""
calculado
iex()> 5+4;5+1
6
# >>> Utilizar valores calculados anteriores en el shell <<<
iex(1)> 5 + 4
9
iex(2)> v 1
9
iex(3)> v(1)
9
iex(4)> v(1) + 11
20
iex(5)> v(4)
20
"""

# >>> Cuando nos equivocamos en una expresión y no permite continuar el shell <<<
"""
iex(1)> (5+4
...(1)>
...(1)> sd
iex(1)> #iex:break
iex(1)>
"""

# >>> Para salir del Shell se puede mediante CTRL+C o escribiendo System.halt <<<
"""
iex()> System.halt
C:\>
"""
