import 'package:flutter_estados/models/usuario.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;
  Rx<Usuario> usuario = Usuario().obs;

  int get profesionesCount {
    return usuario.value.profesiones.length;
  }

  void cargarUsuario(Usuario pUsuario) {
    usuario.value = pUsuario;
    existeUsuario.value = true;
  }

  void cambiarEdad(int edad) {
    usuario.update((val) {
      val!.edad = edad;
    });
  }

  void agregarProfesion(String profesion) {
    usuario.update((val) {
      val!.profesiones = [...val.profesiones, profesion];
    });
  }
}
