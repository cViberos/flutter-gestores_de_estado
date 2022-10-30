// ignore: slash_for_doc_comments
/**
 * Este es el archivo que se encarga de recibir y hacer las peticiones http
 * el que va a cambiar el estado es este archivo
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/usuario.dart';

part 'usuario_state.dart';

/// El cubit siempre tiene que tener un estado inicial indicando el tipo de dato que va a fluir
class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    //Guardamos el estado actual en una variable
    final currentState = state;
    // Preguntamos si el estado actual es de tipo estado UsuarioActivo
    if (currentState is UsuarioActivo) {
      // Creamos una variable donde guardaremos el estado actual modificando la edad
      final newUser = currentState.usuario.copyWith(edad: 30);
      // Emitimos el evento para cambiar el estado de Usuario Activo
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion() {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      // currentState.usuario
      final newProfesiones = [
        ...?currentState.usuario.profesiones,
        'Profesión ${currentState.usuario.profesiones!.length + 1}'
      ];
      final newUser =
          currentState.usuario.copyWith(profesiones: newProfesiones);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
