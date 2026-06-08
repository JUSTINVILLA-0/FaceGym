import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final correoController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _registrar() async {
    if (correoController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('correo', correoController.text);
      await prefs.setString('password', passwordController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cuenta creada correctamente")),
      );

      Navigator.pop(context); // Regresa al login
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crear Cuenta")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: correoController,
              decoration: const InputDecoration(
                labelText: "Correo",
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Contraseña",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _registrar,
              child: const Text("Registrarse"),
            ),
          ],
        ),
      ),
    );
  }
}
