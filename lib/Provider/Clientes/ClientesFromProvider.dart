// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class ClientesFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();

  String id = '';
  String nombre = '';
  String apellido = '';
  String tipoDocumento = '';
  String documento = '';
  String correo = '';
  String celular = '';
  String ciudad = '';
  String pin = '';
  String rol = '';
  String estado = '';

  validateFrom() {
    if (fromkey.currentState!.validate()) {
      print('from valid ... login');

      return true;
    } else {
      print('from not valid');
      return false;
    }
  }

  validateNull() {
    if (nombre.isNotEmpty ||
        celular.isNotEmpty ||
        ciudad.isNotEmpty ||
        correo.isNotEmpty ||
        rol.isNotEmpty ||
        estado.isNotEmpty) {
      print('true');
      return true;
    } else {
      print('false');

      return false;
    }
  }
}
