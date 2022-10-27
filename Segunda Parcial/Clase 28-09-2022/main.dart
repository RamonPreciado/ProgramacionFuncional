import 'dart:io';

/* void main(List<String> args) {
  var n1 = 15;
  var n2 = 7;
  print("SUMA: $n1 + $n2 = ${n1 + n2}");
  print("RESTA: $n1 - $n2 = ${n1 - n2}");
  print("MULTIPLICACION: $n1 * $n2 = ${n1 * n2}");
  print("DIVISION: $n1 / $n2 = ${n1 / n2}");
  print("DIVISION ENTERA: $n1 ~/ $n2 = ${n1 ~/ n2}");
  print(pow(5, 3));
  print(max(5, 3));
  print(min(5, 3));
  print("Seno: ${sin(45 * pi / 180)}");
  print("Coseno: ${cos(45 * pi / 180)}");
  print("Sqrt: ${sqrt(45 * pi / 180)}");
  print(10.isOdd);
  print(10.isEven);
}
 */

/* void main(List<String> args) {
  var contador = 0;
  contador = contador + 1;
  print(contador);
  contador++;
  print(contador);
  ++contador;
  print(contador);
  contador += 2;
  print(contador);
  contador = 10;
  contador = contador - 1;
  print(contador);
  contador--;
  print(contador);
  --contador;
  print(contador);
  contador -= 2;
  print(contador)
}
 */

/* void main(List<String> args) {
  double contador = 3;
  contador /= 2; // Contador = contador / 2;
  // contador %=2; // contador =  contador % 2;
  // contador *= 2; // contador = contador *2
  print(contador);
} */

/* void main(List<String> args) {
  // const miEntero = 10; // Tiempo de compilacion
  // miEntero = 15; // No se puede modificar una constante
  // print(miEntero);
  const costEntero = 10;
  final finalEntero;
  print("Escribe un mensaje: ");
  var numero = stdin.readLineSync();
  finalEntero = numero;
  print("El mensaje es: $numero");
  // finalEntero = "Hola";
  // constEntero = 10 ; // No se puede modificar asi
  // finalEntero = 8;
  // Tiempo de codificacion
  // Tiempo de compilacion
  // Tiempo de ejecucion
} */

/* void main(List<String> args) {
  var cadena = 5;
  print(cadena is String);
  print(cadena.runtimeType);
  var cadena1 = "Hola ";
  var cadena2 = "Mundo";
  var nombre = "Ramon ";
  var edad = 18;
  print(cadena1 + cadena2);
  print("$cadena1 $cadena2");
  print(nombre + edad.toString());
  print("$nombre $edad");
} */

/* void main(List<String> args) {
  // Sistemas Binarios
  // Binario
  print(125.toRadixString(2));
  print(125.toRadixString(8));
  print(125.toRadixString(16));
  var numero = 0xFFFF;
  print(numero.runtimeType);
}
 */

void main(List<String> args) {
  // Listas
  // List<int> miLista = [1, 2, 3, 4];
  // print(miLista);
  // var miLista2 = [1, "Hola", 9.8, true];
  // print(miLista2);
  // // Agregar elementos a la lista
  // miLista2.add(3.1416);
  // print(miLista2);

  // miLista.add(5);
  // print(miLista);

  // listas
  final miLista = const [1, 2, 3, 4]; // avoid side effects
  print(miLista);

  for (var i = 0; i < miLista.length; i++) {
    stdout.write("$i: ${miLista[i]} | ");
    // print("$i: ${miLista[i]}");
  }

  // agregar elementos a lista
  // miLista.add(5);
  // print(miLista);
}
