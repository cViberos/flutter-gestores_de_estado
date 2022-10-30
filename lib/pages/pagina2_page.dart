import 'package:flu_estados/bloc/usuario/usuario_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final newUsuario = Usuario(
                  nombre: 'Cristian Vibeeros',
                  edad: 29,
                  profesiones: [
                    'Desarrollador Front-end',
                    'Desarrollador Backend',
                  ],
                );
                usuarioCubit.seleccionarUsuario(newUsuario);
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.cambiarEdad(30);
              },
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.agregarProfesion();
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
