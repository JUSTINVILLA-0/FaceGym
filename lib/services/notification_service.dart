class NotificationService {

  static List<String> notificaciones = [];

  static void agregar(String mensaje) {
    notificaciones.insert(0, mensaje);
  }

  static List<String> obtener() {
    return notificaciones;
  }

}