import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/usuario/usuario_cubit.dart';
import '../models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario(),
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: BlocBuilder<UsuarioCubit, UsuarioState>(builder: (_, state) {
        /// Imprimimos el estado del cubit
        // print(state);

        /// METODO CON SWITCH
        switch (state.runtimeType) {
          case UsuarioInitial:
            return const Center(child: Text('No hay información del usuario'));

          case UsuarioActivo:
            return InformacionUsuario((state as UsuarioActivo).usuario);

          default:
            return const Center(child: Text('Estado no reconocido '));
        }

        /// METODO TRADICIONAL
        // if (state is UsuarioInitial) {
        //   return const Center(child: Text('No hay información del usuario'));
        // } else if (state is UsuarioActivo) {
        //   return InformacionUsuario(state.usuario);
        // } else {
        //   return const Center(child: Text('Estado no reconocido'));
        // }
      }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.accessibility_new),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

// ignore: use_key_in_widget_constructors
class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          const Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),

          /// Lista de profesiones
          ...usuario.profesiones!
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList()
        ],
      ),
    );
  }
}
