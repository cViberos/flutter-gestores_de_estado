/// Son acciones (eventos) que ustedes van a poder disparar,
/// estas son recibidas por el bloc para así cambiar el state.

part of 'user_bloc.dart';

/*
 El objetivo de esta clase abstracta es crear eventos que van a extenderse desde
 la clase, también podremos definir que todos los eventos puedan tener un type 
 o definir un cirto tipo de información.

 Podemos imaginar la clase Español, le decimos a bloc que solamente vamos a hablar
 en español, entonces solo las palabras (clases o eventos) en español las puedo 
 comprender. Si alguien viene con una clase en inglés y mi bloc solo entiende
 español, entonces yo no se que hacer, para prevenir eso cuando recibamos un 
 evento que no sea español, le vamos a decir que no conocemos, le marcamos un 
 error y ni siquiera me va a dejar trabajar en mi aplicación.
*/

@immutable
abstract class UserEvent {}

// EVENTO ACTIVAR USUARIO
class ActivateUser extends UserEvent {
  final Usuario user;

  /*
   CONSTRUCTOR POSICIONAL
   Es decir, siempre me tienen que mandar este usuario cada vez que se crea el evento
  */
  ActivateUser(this.user);
}

// EVENTO CAMBIAR EDAD
class ChangeUserAge extends UserEvent {
  final int age;
  ChangeUserAge(this.age);
}

// EVENTO AGREGAR PROFESION
class AddProfession extends UserEvent {
  final String profession;
  AddProfession(this.profession);
}

// BORRAR USUARIO
class DeleteUser extends UserEvent {}
