import 'package:flutter/material.dart';
import '../models/usuario.dart';

// ignore: slash_for_doc_comments
/**
 * --with es para trabajar con mixins, un mixin es para heredar una porción de 
 * código o un snippet (podríamos verlo así) 
 * 
 * --extends es para extender o heredar una clase y su funcionalidad a otra...
 * 
 * La diferencia radica en cuanta información la clase inicial heredará de su 
 * extend o mixin. El mixin es mucho menos código heredado.
 */
class UsuarioService with ChangeNotifier {
  // Usuario _usuariodata = Usuario(nombre: '', edad: 0);
  Usuario? _usuariodata;

  Usuario get usuario => _usuariodata!;
  bool get existeUsuario => (_usuariodata != null) ? true : false;

  set usuario(Usuario user) {
    _usuariodata = user;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    _usuariodata!.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    _usuariodata = null;
    notifyListeners();
  }

  void agregarProfesion() {
    _usuariodata!.profesiones!
        .add('Profesion ${_usuariodata!.profesiones!.length + 1}');
    notifyListeners();
  }
}
