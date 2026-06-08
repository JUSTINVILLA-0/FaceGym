import 'package:flutter/material.dart';

import '../models/comment_model.dart';
import '../models/post_model.dart';
import '../services/notification_service.dart';

class CommentsScreen extends StatefulWidget {
  final PostModel post;

  const CommentsScreen({
    super.key,
    required this.post,
  });

  @override
  State<CommentsScreen> createState() =>
      _CommentsScreenState();
}

class _CommentsScreenState
    extends State<CommentsScreen> {

  final comentarioController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Comentarios"),
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount:
                  widget.post.comentarios.length,

              itemBuilder: (context, index) {

                final comentario =
                    widget.post.comentarios[index];

                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),

                  title: Text(
                    comentario.usuario,
                  ),

                  subtitle: Text(
                    comentario.comentario,
                  ),

                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),

                    onPressed: () {

                      setState(() {

                        widget.post.comentarios
                            .removeAt(index);

                      });

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Comentario eliminado",
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),

            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    controller:
                        comentarioController,

                    decoration:
                        const InputDecoration(
                      hintText:
                          "Escribe un comentario...",
                      border:
                          OutlineInputBorder(),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                IconButton(
                  icon: const Icon(
                    Icons.send,
                    size: 30,
                  ),

                  onPressed: () {

                    if (comentarioController
                        .text
                        .trim()
                        .isEmpty) {
                      return;
                    }

                    setState(() {

                      widget.post.comentarios.add(
                        CommentModel(
                          usuario: "Justin",
                          comentario:
                              comentarioController.text,
                        ),
                      );

                    });

                    NotificationService.agregar(
                      "💬 Justin comentó una publicación",
                    );

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Comentario agregado",
                        ),
                      ),
                    );

                    comentarioController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}