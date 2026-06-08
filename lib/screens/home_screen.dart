import 'dart:io';

import 'package:flutter/material.dart';

import '../services/post_service.dart';
import '../services/story_service.dart';
import '../services/user_service.dart';

import 'create_story_screen.dart';
import 'story_screen.dart';

import '../widgets/post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    final posts =
        PostService.obtenerFeed(
      UserService.seguidos,
    );

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "FaceGym",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(
              Icons.refresh,
            ),
          ),

        ],
      ),

      body: RefreshIndicator(

        onRefresh: () async {
          setState(() {});
        },

        child: ListView(

          children: [

            SizedBox(
              height: 120,

              child: ListView.builder(

                scrollDirection:
                    Axis.horizontal,

                itemCount:
                    StoryService.historias.length + 1,

                itemBuilder:
                    (context, index) {

                  // BOTÓN TU HISTORIA

                  if (index == 0) {

                    return GestureDetector(

                      onTap: () async {

                        await Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (_) =>
                                const CreateStoryScreen(),
                          ),
                        );

                        setState(() {});
                      },

                      child: const Padding(
                        padding:
                            EdgeInsets.all(8),

                        child: Column(
                          children: [

                            CircleAvatar(
                              radius: 25,
                              child: Icon(
                                Icons.add,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              "Tu historia",
                            ),

                          ],
                        ),
                      ),
                    );
                  }

                  final historia =
                      StoryService
                          .historias[index - 1];

                  return GestureDetector(

                    onTap: () {

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (_) =>
                              StoryScreen(
                            usuario:
                                historia.usuario,
                            texto:
                                historia.texto,
                            imagen:
                                historia.imagen,
                          ),
                        ),
                      );

                    },

                    child: Padding(
                      padding:
                          const EdgeInsets.all(
                        8,
                      ),

                      child: Column(
                        children: [

                          CircleAvatar(
                            radius: 25,

                            backgroundImage:
                                historia.imagen
                                        .isNotEmpty
                                    ? FileImage(
                                        File(
                                          historia.imagen,
                                        ),
                                      )
                                    : null,

                            child:
                                historia.imagen
                                        .isEmpty
                                    ? const Icon(
                                        Icons.person,
                                      )
                                    : null,
                          ),

                          const SizedBox(
                            height: 5,
                          ),

                          Text(
                            historia.usuario,
                            overflow:
                                TextOverflow
                                    .ellipsis,
                          ),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            if (posts.isEmpty)

              const Padding(
                padding:
                    EdgeInsets.all(20),

                child: Center(
                  child: Text(
                    "No hay publicaciones",
                  ),
                ),
              ),

            ...posts.map(
              (post) => PostCard(
                post: post,
              ),
            ),

          ],
        ),
      ),
    );
  }
}