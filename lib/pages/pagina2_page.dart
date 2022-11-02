import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user/user_bloc.dart';

import '../models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//==============================================================================
//
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
//
//==============================================================================

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
//==============================================================================
//
                final newUser = Usuario(
                  nombre: 'Cristian',
                  edad: 28,
                  profesiones: ['FullStack Developer'],
                );

                userBloc.add(ActivateUser(newUser));
//
//==============================================================================
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
//==============================================================================
//
                userBloc.add(ChangeUserAge(25));
//
//==============================================================================
              },
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
//==============================================================================
//
                userBloc.add(AddProfession('Nueva profesion'));
//
//==============================================================================
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
