import 'dart:io';

import 'package:flutter/material.dart';

class StoryScreen extends StatelessWidget {

  final String usuario;
  final String texto;
  final String imagen;

  const StoryScreen({
    super.key,
    required this.usuario,
    required this.texto,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,

      body: Stack(

        fit: StackFit.expand,

        children: [

          if (imagen.isNotEmpty)

            Image.file(
              File(imagen),
              fit: BoxFit.cover,
            ),

          Container(
            color: Colors.black45,
          ),

          Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,

              children: [

                Text(
                  usuario,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  texto,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}