import 'package:flu_estados/models/usuario.dart';
import 'package:flu_estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Text('Nombre: ${usuarioService.usuario.nombre}')
                : const Text('Pagina 2');
          },
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final nuevoUsuario = Usuario(nombre: 'Cristian', edad: 28);
                usuarioService.cargarUsuario(nuevoUsuario);
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioService.cambiarEdad(30);
              },
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: const Text(
                'Añadir Profesion',
                style: TextStyle(color: Colors.white),
              )),
        ],
      )),
    );
  }
}
