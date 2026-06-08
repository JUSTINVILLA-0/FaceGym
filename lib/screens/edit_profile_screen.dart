import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/user_service.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState
    extends State<EditProfileScreen> {

  late TextEditingController nombreController;
  late TextEditingController bioController;

  File? fotoSeleccionada;

  @override
  void initState() {
    super.initState();

    final usuario =
        UserService.usuarioActual();

    nombreController =
        TextEditingController(
      text: usuario.nombre,
    );

    bioController =
        TextEditingController(
      text: usuario.descripcion,
    );
  }

  Future<void> seleccionarFoto() async {

    final picker = ImagePicker();

    final XFile? imagen =
        await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (imagen != null) {

      setState(() {

        fotoSeleccionada =
            File(imagen.path);

      });

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Editar Perfil",
        ),
      ),

      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(20),

        child: Column(
          children: [

            GestureDetector(
              onTap: seleccionarFoto,

              child: CircleAvatar(
                radius: 60,

                backgroundImage:
                    fotoSeleccionada != null
                        ? FileImage(
                            fotoSeleccionada!,
                          )
                        : null,

                child: fotoSeleccionada == null
                    ? const Icon(
                        Icons.camera_alt,
                        size: 40,
                      )
                    : null,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Toca para cambiar foto",
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
                  nombreController,

              decoration:
                  const InputDecoration(
                labelText: "Nombre",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller:
                  bioController,

              decoration:
                  const InputDecoration(
                labelText: "Biografía",
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {

                UserService.actualizarPerfil(

                  nombre:
                      nombreController.text,

                  descripcion:
                      bioController.text,

                  fotoPerfil:
                      fotoSeleccionada
                              ?.path ??
                          UserService
                              .usuarioActual()
                              .fotoPerfil,
                );

                Navigator.pop(
                  context,
                  true,
                );

              },

              child: const Text(
                "Guardar",
              ),
            ),
          ],
        ),
      ),
    );
  }
}