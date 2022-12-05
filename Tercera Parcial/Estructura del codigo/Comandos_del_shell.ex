>>> Para pedir ayuda del Shell <<<
"""
iex()> h
* IEx.Helpers
Welcome to Interactive Elixir. You are currently
seeing the documentation for the module `IEx.Helpers`
which provides many helpers to make Elixir's shell
more joyful to work with.
.
.
.
 * `b/1` - prints callbacks info and docs for a given module
 * `c/1` - compiles a file
 * `c/2` - compiles a file and writes bytecode to the given p
ath
.
.
.
To learn more about IEx as a whole, type `h(IEx)`.
"""

>>> Para ver la ayuda específica de alguna opción (macro) se puede indicar como h <<<
# opción, o h(opción)
"""
iex()> h b
* defmacro b(term)
"""
# Prints the documentation for the given callback function.
# It also accepts single module argument to list
# all available behaviour callbacks.
## Examples
"""
 iex> b(Mix.Task.run/1)
 iex> b(Mix.Task.run)
 iex> b(GenServer)
iex()> h(b)
* defmacro b(term)
"""

# Prints the documentation for the given callback function.
# It also accepts single module argument to list
# all available behaviour callbacks.
## Examples
 """
 iex> b(Mix.Task.run/1)
 iex> b(Mix.Task.ru
 """
