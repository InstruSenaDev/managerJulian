// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class CiudadesFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();

  String id = '';
  String documento = '';
  String nombre = '';
  String direccion = '';
  String telefono = '';
  String celular = '';
  String ciudad = '';
  String departamento = '';
  String correo = '';
  String correofactura = '';
  String idvendedor = '';
  String contrasena = '';
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
        direccion.isNotEmpty ||
        telefono.isNotEmpty ||
        celular.isNotEmpty ||
        ciudad.isNotEmpty ||
        departamento.isNotEmpty ||
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
