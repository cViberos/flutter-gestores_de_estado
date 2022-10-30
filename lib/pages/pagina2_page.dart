import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/usuario.dart';
import '../services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text('Nombre: ${usuarioService.usuario.nombre}')
            : const Text('Página 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              final usuarioService =
                  Provider.of<UsuarioService>(context, listen: false);
              usuarioService.usuario = Usuario(
                  nombre: 'Cristian',
                  edad: 20,
                  profesiones: ['Fullstack Developer', 'Videojugador experto']);
            },
            child: const Text(
              'Establecer Usuario',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                // usuarioService.cambiarEdad(45);
                context.read<UsuarioService>().cambiarEdad(29);
              },
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioService.agregarProfesion();
              },
              child: const Text(
                'Añadir Profesion',
                style: TextStyle(color: Colors.white),
              )),
        ],
      )),
    );
  }
}
