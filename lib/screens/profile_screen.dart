import 'dart:io';

import 'package:flutter/material.dart';

import '../services/post_service.dart';
import '../services/user_service.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState
    extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {

    final usuario =
        UserService.usuarioActual();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi Perfil"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              const SizedBox(height: 10),

              CircleAvatar(
                radius: 60,

                backgroundImage:
                    usuario.fotoPerfil.startsWith("/")
                        ? FileImage(
                            File(
                              usuario.fotoPerfil,
                            ),
                          )
                        : AssetImage(
                            usuario.fotoPerfil,
                          ) as ImageProvider,
              ),

              const SizedBox(height: 15),

              Text(
                usuario.nombre,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                usuario.descripcion,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  icon: const Icon(Icons.edit),

                  label: const Text(
                    "Editar Perfil",
                  ),

                  onPressed: () async {

                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const EditProfileScreen(),
                      ),
                    );

                    setState(() {});
                  },
                ),
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,

                children: [

                  _buildStatCard(
                    "${PostService.obtenerPosts().length}",
                    "Posts",
                  ),

                  _buildStatCard(
                    "${_totalLikes()}",
                    "Likes",
                  ),

                  _buildStatCard(
                    "${UserService.seguidos.length}",
                    "Siguiendo",
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mis Logros",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const Card(
                child: ListTile(
                  leading: Icon(Icons.emoji_events),
                  title: Text(
                    "30 días entrenando",
                  ),
                ),
              ),

              const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.local_fire_department,
                  ),
                  title: Text(
                    "100 entrenamientos",
                  ),
                ),
              ),

              const Card(
                child: ListTile(
                  leading: Icon(
                    Icons.fitness_center,
                  ),
                  title: Text(
                    "Meta Fitness Completa",
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Usuarios Seguidos",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              if (UserService.seguidos.isEmpty)

                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Aún no sigues a nadie",
                    ),
                  ),
                ),

              ...UserService.seguidos.map(
                (usuarioSeguido) => Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    title: Text(
                      usuarioSeguido,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mis Publicaciones",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              if (PostService.obtenerPosts().isEmpty)

                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "No tienes publicaciones",
                    ),
                  ),
                ),

              ...PostService.obtenerPosts().map(
                (post) => Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.image,
                    ),
                    title: Text(
                      post.descripcion,
                    ),
                    subtitle: Text(
                      "❤️ ${post.likes}   💬 ${post.comentarios.length}",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _totalLikes() {

    int total = 0;

    for (var post in PostService.obtenerPosts()) {
      total += post.likes;
    }

    return total;
  }

  Widget _buildStatCard(
    String valor,
    String titulo,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [

            Text(
              valor,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(titulo),
          ],
        ),
      ),
    );
  }
}