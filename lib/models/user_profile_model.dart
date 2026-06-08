class UserProfileModel {

  final String nombre;

  bool siguiendo;

  UserProfileModel({
    required this.nombre,
    this.siguiendo = false,
  });
}