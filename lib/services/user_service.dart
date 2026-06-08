import '../models/user_model.dart';

class UserService {

  static UserModel usuario = UserModel(
    id: "1",
    nombre: "Justin Villa",
    fotoPerfil: "assets/images/profile.jpg",
    descripcion: "Fitness Lover 💪",
  );

  static List<String> seguidos = [];

  static UserModel usuarioActual() {
    return usuario;
  }

  static void actualizarPerfil({
    required String nombre,
    required String descripcion,
    required String fotoPerfil,
  }) {

    usuario = UserModel(
      id: usuario.id,
      nombre: nombre,
      fotoPerfil: fotoPerfil,
      descripcion: descripcion,
    );
  }

  static void seguirUsuario(String nombre) {

    if (!seguidos.contains(nombre)) {
      seguidos.add(nombre);
    }
  }

  static void dejarDeSeguir(String nombre) {
    seguidos.remove(nombre);
  }

  static bool estaSiguiendo(String nombre) {
    return seguidos.contains(nombre);
  }
}