import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const FaceGymApp());
}

class FaceGymApp extends StatelessWidget {
  const FaceGymApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FaceGym',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.dark,

        scaffoldBackgroundColor:
            const Color(0xFF121212),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          centerTitle: true,
          elevation: 0,
        ),

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),

        elevatedButtonTheme:
            ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize:
                const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(12),
            ),
          ),
        ),

        inputDecorationTheme:
            InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF1E1E1E),

          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(12),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
        ),
      ),

      home: const SplashScreen(),
    );
  }
}