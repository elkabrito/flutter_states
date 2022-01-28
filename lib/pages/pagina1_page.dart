import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_estados/bloc/user/user_bloc.dart';
import 'package:flutter_estados/models/usuario.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: (){
              BlocProvider.of<UserBloc>(context, listen: false)
              .add(DeleteUser());
            }
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {

          return state.existUser
           ? InformacionUsuario( user: state.user!, )
           :  const Center(
             child: Text('No hay usuario seleccionado'),
           );
                     
        },
      ),
     floatingActionButton: FloatingActionButton(
       child: Icon( Icons.accessibility_new),
       onPressed: (){
         Navigator.pushNamed(context, 'pagina2');
       },
     ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario user;

  const InformacionUsuario({Key? key, required this.user}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
         height: double.infinity,
         width: double.infinity,
         padding: EdgeInsets.all(20.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children:  [             
            const Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const Divider(),

             ListTile( title: Text('Nombre: ${ user.nombre }'),),
             ListTile( title: Text('Edad: ${ user.edad } '),),

            const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const Divider(),
            
            ...user.profesiones.map((profesion) => ListTile(
              title: Text(profesion),
            )).toList()
             
           ],
         ),
    );
  }
}