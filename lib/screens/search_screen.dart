import 'package:flutter/material.dart';
import 'user_profile_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() =>
      _SearchScreenState();
}

class _SearchScreenState
    extends State<SearchScreen> {

  final usuarios = [
    "Justin",
    "Alex",
    "Carlos",
    "Luis",
    "Miguel",
    "David",
  ];

  String busqueda = "";

  @override
  Widget build(BuildContext context) {

    final filtrados = usuarios.where((u) {
      return u
          .toLowerCase()
          .contains(busqueda.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Buscar"),
      ),

      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(10),

            child: TextField(
              decoration: const InputDecoration(
                hintText: "Buscar usuario...",
                prefixIcon: Icon(Icons.search),
              ),

              onChanged: (value) {
                setState(() {
                  busqueda = value;
                });
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filtrados.length,

              itemBuilder: (context, index) {

                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),

                  title: Text(
                    filtrados[index],
                  ),

                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            UserProfileScreen(
                          nombre: filtrados[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
