import 'dart:io';
import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../screens/comments_screen.dart';
import '../services/post_service.dart';
import '../services/notification_service.dart';

class PostCard extends StatefulWidget {
  final PostModel post;

  const PostCard({
    super.key,
    required this.post,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.all(10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),

            title: Text(
              widget.post.usuario,
            ),

            subtitle: Text(
              "${widget.post.likes} Likes",
            ),

            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),

              onPressed: () {

                showDialog(
                  context: context,

                  builder: (_) => AlertDialog(

                    title: const Text(
                      "Eliminar publicación",
                    ),

                    content: const Text(
                      "¿Deseas eliminar esta publicación?",
                    ),

                    actions: [

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        child: const Text(
                          "Cancelar",
                        ),
                      ),

                      TextButton(
                        onPressed: () {

                          PostService.eliminarPost(
                            widget.post.id,
                          );

                          NotificationService.agregar(
                            "🗑️ Se eliminó una publicación",
                          );

                          Navigator.pop(context);

                          setState(() {});

                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Publicación eliminada",
                              ),
                            ),
                          );
                        },

                        child: const Text(
                          "Eliminar",
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          if (widget.post.imagen.isNotEmpty)

            Image.file(
              File(widget.post.imagen),

              height: 250,
              width: double.infinity,

              fit: BoxFit.cover,
            ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),

            child: Row(
              children: [

                IconButton(

                  onPressed: () {

                    setState(() {

                      if (widget.post.liked) {

                        widget.post.likes--;
                        widget.post.liked = false;

                      } else {

                        widget.post.likes++;
                        widget.post.liked = true;

                        NotificationService.agregar(
                          "❤️ Alguien dio like a tu publicación",
                        );
                      }

                    });

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      SnackBar(
                        duration: const Duration(
                          milliseconds: 800,
                        ),

                        content: Text(
                          widget.post.liked
                              ? "❤️ Like agregado"
                              : "💔 Like eliminado",
                        ),
                      ),
                    );
                  },

                  icon: Icon(
                    Icons.favorite,

                    color:
                        widget.post.liked
                            ? Colors.red
                            : Colors.grey,
                  ),
                ),

                Text(
                  "${widget.post.likes}",
                ),

                const SizedBox(width: 15),

                IconButton(

                  onPressed: () async {

                    await Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (_) =>
                            CommentsScreen(
                          post: widget.post,
                        ),
                      ),
                    );

                    setState(() {});
                  },

                  icon: const Icon(
                    Icons.comment,
                  ),
                ),

                Text(
                  "${widget.post.comentarios.length}",
                ),

                const Spacer(),

                IconButton(
                  onPressed: () {

                    NotificationService.agregar(
                      "📤 Compartiste una publicación",
                    );

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Publicación compartida",
                        ),
                      ),
                    );
                  },

                  icon: const Icon(
                    Icons.share,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),

            child: Text(
              widget.post.descripcion,

              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}