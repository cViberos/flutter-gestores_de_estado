/// Es quien tiene la información de cúal es el estado actual y procesa los eventos
/// El mismo no tiene que mutar los estados, sino que simplemente tiene que llamarlos

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

/*
 El blog necesita que yo le diga los tipos de eventos que espera o los tipos de 
 eventos que puede manejar (UserEvent) y los tipos de Estado (UserState).
*/
class UserBloc extends Bloc<UserEvent, UserState> {
  /// Definimos el estado inicial del bloc
  UserBloc() : super(const UserInitialState()) {
    /*
     event: recibimos el evento del tipo especificado con toda la información.

     emit: nos va a servir para emitir un nuevo estado de manera condicional, 
     lo llamamos cuando queremos cambiar el estado siempre y cuando la 
     información sea válida.
    */
    on<ActivateUser>((event, emit) {
      /// Llamamos la funcion emit para cambiar el estado
      emit(UserSetStare(event.user));
    });

    on<DeleteUser>((event, emit) => emit(const UserInitialState()));

    on<ChangeUserAge>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetStare(state.user!.copyWith(edad: event.age)));
    });

    on<AddProfession>((event, emit) {
      if (!state.existUser) return;

      /// La siguiente linea desestructura la lista de profesiones y la vuelve a
      /// armar agregando la nueva profesion
      final professions = [...state.user!.profesiones, event.profession];
      emit(UserSetStare(state.user!.copyWith(profesiones: professions)));
    });
  }
}
