import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_estados/models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) => emit(UserSetState( event.user )));


    on<ChangeUserAge>((event, emit){     
       if(!state.existUser)return;
       

       emit(UserSetState( state.user!.copyWith(edad: event.age) ));

    });

    on<AddProfession>(((event, emit) {

      if(!state.existUser) return;
      
      final nuevasProfesiones = [
        ...state.user!.profesiones,
        event.nuevaProfesion + " " + state.user!.profesiones.length.toString()
      ];

      emit(UserSetState(state.user!.copyWith(profesiones: nuevasProfesiones)));

    }));

     on<DeleteUser>((event, emit) => emit( const UserInitialState() ));

  }


  

}
