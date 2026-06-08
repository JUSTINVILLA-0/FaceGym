import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/story_model.dart';
import '../services/story_service.dart';
import '../services/user_service.dart';

class CreateStoryScreen extends StatefulWidget {
  const CreateStoryScreen({super.key});

  @override
  State<CreateStoryScreen> createState() =>
      _CreateStoryScreenState();
}

class _CreateStoryScreenState
    extends State<CreateStoryScreen> {

  final textoController =
      TextEditingController();

  File? imagen;

  Future<void> seleccionarImagen() async {

    final picker = ImagePicker();

    final picked =
        await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (picked != null) {

      setState(() {
        imagen = File(picked.path);
      });

    }
  }

  void publicarHistoria() {

    StoryService.agregarHistoria(

      StoryModel(
        usuario:
            UserService.usuarioActual()
                .nombre,

        texto:
            textoController.text,

        imagen:
            imagen?.path ?? "",
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Nueva Historia",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            ElevatedButton.icon(
              onPressed:
                  seleccionarImagen,

              icon: const Icon(
                Icons.image,
              ),

              label: const Text(
                "Seleccionar Imagen",
              ),
            ),

            const SizedBox(height: 20),

            if (imagen != null)

              Image.file(
                imagen!,
                height: 200,
              ),

            const SizedBox(height: 20),

            TextField(
              controller:
                  textoController,

              decoration:
                  const InputDecoration(
                hintText:
                    "Texto de la historia",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed:
                  publicarHistoria,

              child: const Text(
                "Publicar Historia",
              ),
            ),
          ],
        ),
      ),
    );
  }
}