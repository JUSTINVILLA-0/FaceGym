import 'comment_model.dart';

class PostModel {
  final String id;
  final String usuario;
  final String imagen;
  final String descripcion;

  int likes;

  bool liked;

  List<CommentModel> comentarios;

  PostModel({
    required this.id,
    required this.usuario,
    required this.imagen,
    required this.descripcion,
    required this.likes,
    required this.liked,
    required this.comentarios,
  });
}