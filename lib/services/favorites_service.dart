import '../models/post_model.dart';

class FavoritesService {

  static List<PostModel> favoritos = [];

  static void agregar(PostModel post) {

    if (!favoritos.contains(post)) {
      favoritos.add(post);
    }

  }

  static void eliminar(PostModel post) {
    favoritos.remove(post);
  }

  static List<PostModel> obtenerFavoritos() {
    return favoritos;
  }
}