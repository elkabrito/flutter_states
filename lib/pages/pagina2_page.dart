import 'package:flutter/material.dart';
import 'package:flutter_estados/controllers/usuario_controller.dart';
import 'package:flutter_estados/models/usuario.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usuarioCtr = Get.find<UsuarioController>();
  
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
                                 
                 usuarioCtr.cargarUsuario(Usuario(nombre: 'Luis Ochoa', edad: 35 ));
                 Get.snackbar('Usuario establecido', 
                  'Fernando es el nombre del usuario', 
                  backgroundColor: Colors.white,
                  boxShadows: [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10
                    )
                  ]);
              }
            ),

             MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
             
                usuarioCtr.cambiarEdad(18);
              
              }
            ),

            MaterialButton(
              child: Text('Añadir profesion', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                 
                 usuarioCtr.agregarProfesion('Profesion #${ usuarioCtr.profesionesCount + 1 }'); 

              }
            ),

            MaterialButton(
              child: Text('Cambiar tema', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                 
                Get.changeTheme( Get.isDarkMode ? ThemeData.light() : ThemeData.dark() );

              }
            )
          ],
        )
     ),
   );
  }
}