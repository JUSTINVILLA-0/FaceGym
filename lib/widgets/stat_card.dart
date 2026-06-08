import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {

  final String titulo;
  final String valor;

  const StatCard({
    super.key,
    required this.titulo,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [

            Text(
              valor,
              style: const TextStyle(
                fontSize: 25,
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