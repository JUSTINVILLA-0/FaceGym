import 'package:flutter/material.dart';

class RoutinesScreen extends StatelessWidget {
  const RoutinesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final rutinas = [
      "Pecho y Tríceps",
      "Espalda y Bíceps",
      "Piernas",
      "Hombros",
      "Cardio",
    ];

    return Scaffold(

      appBar: AppBar(
        title: const Text("Rutinas"),
      ),

      body: ListView.builder(
        itemCount: rutinas.length,

        itemBuilder: (context, index) {

          return Card(
            margin: const EdgeInsets.all(10),

            child: ListTile(
              leading: const Icon(
                Icons.fitness_center,
              ),
              title: Text(rutinas[index]),
            ),
          );
        },
      ),
    );
  }
}