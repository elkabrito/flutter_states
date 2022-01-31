import 'package:flutter/material.dart';
import 'package:flutter_estados/controllers/usuario_controller.dart';
import 'package:flutter_estados/models/usuario.dart';
import 'package:flutter_estados/pages/pagina2_page.dart';
import 'package:get/get.dart';

class Pagina1Page extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: (){
             
            }
          )
        ],
      ),
      body:  Obx( ()=> usuarioCtrl.existeUsuario.value 
       ? InformacionUsuario(usuario: usuarioCtrl.usuario.value,) 
       : NoInfo()),
     floatingActionButton: FloatingActionButton(
       child: Icon( Icons.accessibility_new),
       onPressed: (){
         Get.toNamed('pagina2', arguments: {
           'nombre': 'Luis Ochoa',
           'edad': 35
         });
       },
     ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {

final Usuario usuario;

  const InformacionUsuario({Key? key, required this.usuario}) : super(key: key);

  
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

             ListTile( title: Text('Nombre: ${ usuario.nombre }'),),
             ListTile( title: Text('Edad: ${ usuario.edad }'),),

            const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const Divider(),
            
            ...usuario.profesiones.map((profesion) => ListTile(
              title: Text( profesion),
            ))
           
             
           ],
         ),
    );
  }
}


class NoInfo extends StatelessWidget {
  const NoInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('No hay usuario seleccionado'),
      ),
    );
  }
}