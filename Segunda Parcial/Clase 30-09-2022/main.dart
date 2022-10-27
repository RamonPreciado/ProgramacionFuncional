// import 'dart:io';

// dynamic variable = "HOla";
// print(variable)
// dynamic variable1 = 5;
// print(variable)

// void main() {
//     String nombre = "Ramon";
//     String apellido;
//     int edad = 20;
//     int aActual = 2022
//     int aNacimiento = 2002;
//     double gravedad = 9.81;
//     apellido = "Preciado";
//     print("Hola $nombre $apellido tienes $edad años");
//     print("Hola $nombre $apellido tines ${aActual-aNacimiento} años");
//     print(gravedad);
//     num numero1 = 5;
//     print(numero1);
//     num numero2 = 9.81;
//     print(numero1 * numero2);
// }

// id main() {
//     print("Hola $nombre $apellido tienes ${$aAcutal - aNacimiento} años");
// }

// //funciones
// int calcularEdad (int aActual, int aNacimiento) {
//   return aActual - aNacimiento;
// }

// String getNombre() {
//   return "Ramon";
// }

// String getApellido() {
//   return "Preciado"
// }

// void main () {
//   print("Dame tu edad");
//   var edad = stdin.readLineSync();
//   print(edad);
// }

// tipado estático, definir el tipo de dato
// Inferencia de tipo de dato

// void main () {
//   print("Dame tu edad");
//   // var edad = stdin.readLineSync();  // Recibe y retorna un string con el teclado // en tiempo de ejecucion.
//   // print(edad.runtimeType);
//   // print(edad is int);
//   // print(edad is double);
//   // print(edad is bool);
//   // print(edad is String);
//   // Tiempo de compilacion
//   var status = esPAr(8); 
//   print(status.runtimeType);
//   print("Dame tu edad");
//   var edad = int.parse(stdin.readLineSync());

// }

// bool esPAr(int num){
//   if (num % 2 == 0) {
//     return true;
//   }
//   else{
//     return false;
//   }
// }

// String esPAr(int num){
//   if (num % 2 == 0) {
//     return "SI";
//   }
//   else{
//     return "NO";
//   }
// }

//calculadora
// int calculadora(String op, int n1, int n2){
//   if (op == "+"); {
//     return suma(n1, n2);
//   } else if( op == "-"){
//     return resta(n1, n2);
//   } else if(op == "*"){
//     return multi(n1, n2);
//   }else if (op == "/"){
//     return division(n1, n2);
//   }else {
//     return "Operacion no valida"
//   }
// }

import 'dart:io';
//calculadora que lea dos numeros del teclado y obtenga suma, resta, multiplicación y
//division, usando funciones y asingnado valores a dos variables

void main() {
  String op = leerDatos("Indica la operación [+,-,*,/]");
  int num1 = int.parse(leerDatos("Dame el primer número"));
  int num2 = int.parse(leerDatos("Dame el segundo número"));
  print("${calculadora(op, num1, num2)}");
}

String leerDatos(String mensaje) {
  print(mensaje);
  String data = (stdin.readLineSync()!);
  return data;
}

String calculadora(String op, int n1, int n2) {
  if (op == "+") {
    return "$n1 + $n2 = ${suma(n1, n2)}";
  } else if (op == "-") {
    return "$n1 - $n2 = ${resta(n1, n2)}";
  } else if (op == "*") {
    return "$n1 * $n2 = ${multi(n1, n2)}";
  } else if (op == "/") {
    return "$n1 / $n2 = ${divi(n1, n2)}";
  } else {
    return "Operación inválida";
  }
}

int suma(int num1, int num2) => num1 + num2;
int resta(int num1, int num2) => num1 - num2;
int multi(int num1, int num2) => num1 * num2;
int divi(int num1, int num2) => num1 ~/ num2;
