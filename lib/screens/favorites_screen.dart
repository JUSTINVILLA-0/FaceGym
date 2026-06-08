import 'package:flutter/material.dart';

import '../services/favorites_service.dart';
import '../widgets/post_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() =>
      _FavoritesScreenState();
}

class _FavoritesScreenState
    extends State<FavoritesScreen> {

  @override
  Widget build(BuildContext context) {

    final favoritos =
        FavoritesService.obtenerFavoritos();

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Mis Favoritos",
        ),
      ),

      body: favoritos.isEmpty

          ? const Center(
              child: Text(
                "No tienes publicaciones favoritas",
              ),
            )

          : ListView.builder(
              itemCount:
                  favoritos.length,

              itemBuilder:
                  (context, index) {

                return PostCard(
                  post:
                      favoritos[index],
                );
              },
            ),
    );
  }
}