/// Este nos indica exactamente cómo se encuentra el estado de su aplicación.
/// La aplicacion puede tener muchos estados: (estado inicial, puede borrarse, etc)

part of 'user_bloc.dart';

/*
 Una clase es inmutable si todos los campos de instancia de la clase, ya sean 
 definidos directamente o heredados, son final.
*/

/*
 Las clases abstractas, como su nombre lo indica, son algo abstracto, no 
 representan algo específico y las podemos usar para crear otras clases. No 
 pueden ser instanciadas, por lo que no podemos crear nuevos objetos con ellas.

 Podemos imaginar una clase Animal, con métodos como caminar y comer, como una 
 clase base que podemos heredar para construir otras clases como León o Pájaros.
 Ambas van a heredar de nuestra clase animal con sus respectivos métodos y 
 tendremos la posibilidad de crear nuestros objetos. De esta manera podemos 
 reducir código duplicado y mejorar la calidad del código.
 */

@immutable
abstract class UserState {
  final bool existUser;
  final Usuario? user;

  /* 
   CONSTRUCTOR POR NOMBRE
   Ponemos entre llaves para que sean argumentos con nombre, asi podemos poner
   valor por defecto mucho mas fácil
  */

  const UserState({
    this.existUser = false,
    this.user,
  });
}

// ESTADO INICIAL
class UserInitialState extends UserState {
  const UserInitialState() : super(existUser: false, user: null);
}

// ESTADO SET USUARIO
class UserSetStare extends UserState {
  final Usuario newUser;

  const UserSetStare(this.newUser)
      : super(
          existUser: true,
          user: newUser,
        );
}
