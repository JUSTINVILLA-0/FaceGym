import '../models/post_model.dart';

class PostService {

  static final List<PostModel> _posts = [

    PostModel(
      id: "2",
      usuario: "Alex",
      imagen: "",
      descripcion: "Entrenamiento de pierna 💪",
      likes: 5,
      liked: false,
      comentarios: [],
    ),

    PostModel(
      id: "3",
      usuario: "Liam",
      imagen: "",
      descripcion: "Entrenamiento de pecho 💪",
      likes: 89,
      liked: false,
      comentarios: [],
    ),
  ];

  static List<PostModel> obtenerPosts() {
    return _posts;
  }

  static List<PostModel> obtenerFeed(
    List<String> seguidos,
  ) {

    List<PostModel> feed = [];

    // Publicaciones de usuarios seguidos
    feed.addAll(
      _posts.where(
        (post) => seguidos.contains(
          post.usuario,
        ),
      ),
    );

    // Publicaciones del resto
    feed.addAll(
      _posts.where(
        (post) => !seguidos.contains(
          post.usuario,
        ),
      ),
    );

    return feed;
  }

  static void agregarPost(
    PostModel post,
  ) {
    _posts.insert(0, post);
  }

  static void eliminarPost(
    String id,
  ) {
    _posts.removeWhere(
      (post) => post.id == id,
    );
  }
}