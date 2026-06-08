import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/post_model.dart';
import '../services/post_service.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() =>
      _CreatePostScreenState();
}

class _CreatePostScreenState
    extends State<CreatePostScreen> {

  final descripcionController =
      TextEditingController();

  File? imagenSeleccionada;

  Future<void> seleccionarImagen() async {

    final picker = ImagePicker();

    final XFile? imagen =
        await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (imagen != null) {

      setState(() {
        imagenSeleccionada =
            File(imagen.path);
      });

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nueva Publicación",
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            GestureDetector(
              onTap: seleccionarImagen,

              child: Container(
                height: 220,
                width: double.infinity,

                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius:
                      BorderRadius.circular(15),
                ),

                child: imagenSeleccionada == null

                    ? const Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,

                        children: [

                          Icon(
                            Icons.add_a_photo,
                            size: 60,
                          ),

                          SizedBox(height: 10),

                          Text(
                            "Seleccionar imagen",
                          ),
                        ],
                      )

                    : ClipRRect(
                        borderRadius:
                            BorderRadius.circular(
                          15,
                        ),

                        child: Image.file(
                          imagenSeleccionada!,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
                  descripcionController,

              maxLines: 4,

              decoration:
                  const InputDecoration(
                labelText:
                    "¿Qué entrenaste hoy?",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              icon: const Icon(Icons.send),

              label: const Text(
                "Publicar",
              ),

              onPressed: () {

                if (descripcionController
                    .text
                    .trim()
                    .isEmpty) {
                  return;
                }

                PostService.agregarPost(

                  PostModel(
                    id: DateTime.now()
                        .millisecondsSinceEpoch
                        .toString(),

                    usuario: "Justin",

                    imagen:
                        imagenSeleccionada
                                ?.path ??
                            "",

                    descripcion:
                        descripcionController
                            .text,

                    likes: 0,

                    liked: false,

                    comentarios: [],
                  ),
                );

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Publicación creada",
                    ),
                  ),
                );

                descripcionController
                    .clear();

                setState(() {
                  imagenSeleccionada =
                      null;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}