import 'package:flutter/material.dart';

import '../services/user_service.dart';

class UserProfileScreen extends StatefulWidget {
  final String nombre;

  const UserProfileScreen({
    super.key,
    required this.nombre,
  });

  @override
  State<UserProfileScreen> createState() =>
      _UserProfileScreenState();
}

class _UserProfileScreenState
    extends State<UserProfileScreen> {

  @override
  Widget build(BuildContext context) {

    bool siguiendo =
        UserService.estaSiguiendo(
      widget.nombre,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nombre),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            const CircleAvatar(
              radius: 60,
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              widget.nombre,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Miembro de FaceGym 💪",
            ),

            const SizedBox(height: 20),

            Text(
              siguiendo
                  ? "Sigues a este usuario"
                  : "Aún no sigues a este usuario",
            ),

            const SizedBox(height: 25),

            ElevatedButton.icon(

              onPressed: () {

                setState(() {

                  if (siguiendo) {

                    UserService
                        .dejarDeSeguir(
                      widget.nombre,
                    );

                  } else {

                    UserService
                        .seguirUsuario(
                      widget.nombre,
                    );

                  }

                });

              },

              icon: Icon(
                siguiendo
                    ? Icons.check
                    : Icons.person_add,
              ),

              label: Text(
                siguiendo
                    ? "Siguiendo"
                    : "Seguir",
              ),
            ),
          ],
        ),
      ),
    );
  }
}