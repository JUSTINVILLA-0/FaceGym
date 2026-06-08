import '../models/story_model.dart';

class StoryService {

  static List<StoryModel> historias = [

    StoryModel(
      usuario: "Alex",
      texto: "🔥 Día de pierna",
      imagen: "",
    ),

    StoryModel(
      usuario: "Carlos",
      texto: "💪 Nuevo récord",
      imagen: "",
    ),
  ];

  static void agregarHistoria(
    StoryModel historia,
  ) {
    historias.insert(0, historia);
  }
}