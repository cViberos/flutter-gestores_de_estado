// ignore: slash_for_doc_comments
/**
 * Este archivo engloba todos los posibles estados que nuestra aplicación va a tener
 */

/// Este archivo formara parte del indicado a continuación:
part of 'usuario_cubit.dart';

@immutable
abstract class UsuarioState {}

/// Estado inicial de la aplicación
class UsuarioInitial extends UsuarioState {
  final existeUsuario = false;

  /// Que propiedades tiene el usuario final
  // @override
  // String toString() => 'UsuarioInicial: existeUsuario: false';
}

/// Estado de Usuario activo
class UsuarioActivo extends UsuarioState {
  final existeUsuario = true;
  final Usuario usuario;

  UsuarioActivo(this.usuario);
}
