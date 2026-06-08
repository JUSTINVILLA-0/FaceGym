import 'package:flutter/material.dart';

import '../services/notification_service.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState
    extends State<NotificationsScreen> {

  @override
  Widget build(BuildContext context) {

    final notificaciones =
        NotificationService.obtener();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notificaciones"),
      ),

      body: notificaciones.isEmpty

          ? const Center(
              child: Text(
                "No hay notificaciones",
              ),
            )

          : ListView.builder(
              itemCount:
                  notificaciones.length,

              itemBuilder:
                  (context, index) {

                return ListTile(
                  leading: const Icon(
                    Icons.notifications,
                  ),

                  title: Text(
                    notificaciones[index],
                  ),
                );
              },
            ),
    );
  }
}