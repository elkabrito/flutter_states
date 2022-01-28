import 'package:flutter/material.dart';

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
             
            }
          )
        ],
      ),
      body: InformacionUsuario(),
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

             ListTile( title: Text('Nombre: '),),
             ListTile( title: Text('Edad: '),),

            const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const Divider(),
            
           
             
           ],
         ),
    );
  }
}