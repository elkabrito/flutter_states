import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_estados/bloc/user/user_bloc.dart';
import 'package:flutter_estados/models/usuario.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final userBloc =  BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){

                 final newUser = Usuario(
                   nombre: 'Luis Ochoa',
                   edad: 35,
                   profesiones: [
                     'FullStack Developer'
                   ]
                 );

                //BlocProvider.of<UserBloc>(context, listen: false)
                userBloc.add( ActivateUser(newUser));
              }
            ),

             MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                //BlocProvider.of<UserBloc>(context, listen: false)
                userBloc.add( ChangeUserAge(18));
              }
            ),

            MaterialButton(
              child: Text('Añadir profesion', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                 userBloc.add(AddProfession('Programador'));  
              }
            )
          ],
        )
     ),
   );
  }
}