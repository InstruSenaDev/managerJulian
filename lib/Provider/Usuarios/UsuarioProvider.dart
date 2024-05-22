// ignore_for_file: file_names

import 'dart:convert';

import 'package:dbcrypt/dbcrypt.dart';
import 'package:flutter/material.dart';

import '../../api/AllApi.dart';
import '../../modelo/Usuarios/UsuariosModels.dart';
import 'UsuarioFromProvider.dart';

class UsuariosProvider extends ChangeNotifier {
  List<Usuario> usuarios = [];
  late Usuario isSelectUsuarios;
  String idVendedorSelect = '0';
  String nameVendedorSelect = 'Vendedor';

  bool ascending = true;
  int? sortColumnIndex;

  asignaDateVendor(String id, String name) {
    idVendedorSelect = id;
    nameVendedorSelect = name;
    notifyListeners();
  }

  getUsuarios() async {
    String url = 'admin/web_admin_usuarios.php?case=1';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    final Usuarios usuarios = Usuarios.fromlist(dataMap['rpta']);
    print(resp);
    if (usuarios.dato.isNotEmpty) {
      this.usuarios = usuarios.dato;
    }
    notifyListeners();
  }

  // getCambioEstadoUsuarios(String idCliente, String estado) async {
  //   String url = 'manager.php?case=6&id=$idCliente&estado=$estado&rol=3';
  //   print(AllApi.url + url);
  //   final resp = await AllApi.httpGet(url);
  //   final dataMap = jsonDecode(resp);
  //   final Usuarios usuarios = Usuarios.fromlist(dataMap['rpta']);
  //   print(resp);
  //   if (usuarios.dato.isNotEmpty) {
  //     this.usuarios = usuarios.dato;
  //   }
  //   notifyListeners();
  // }

  // getNewUsuarios(
  //     UsuariosFromProvider fromProvider, BuildContext context) async {
  //   String documento = fromProvider.documento;
  //   String nombre = fromProvider.nombre;
  //   String direccion = fromProvider.direccion;
  //   String telefono = fromProvider.telefono;
  //   String celular = fromProvider.celular;
  //   String ciudad = fromProvider.ciudad;
  //   String departamento = fromProvider.departamento;
  //   String correo = fromProvider.correo;
  //   String rol = fromProvider.rol;
  //   String estado = fromProvider.estado;

  //   var contra1 = DBCrypt().hashpw(documento, DBCrypt().gensalt());

  //   String url =
  //       'manager.php?case=4&documento=$documento&nombre=$nombre&direccion=$direccion&telefono=$telefono&celular=$celular&ciudad=$ciudad&departamento=$departamento&correo=$correo&contrasena=$contra1&rol=$rol&estado=$estado';
  //   print(AllApi.url + url);
  //   final resp = await AllApi.httpGet(url);
  //   final dataMap = jsonDecode(resp);
  //   final Usuarios usuarios = Usuarios.fromlist(dataMap['rpta']);
  //   print(resp);
  //   if (usuarios.dato.isNotEmpty) {
  //     this.usuarios = usuarios.dato;
  //     notifyListeners();
  //     Navigator.pop(context);
  //   }
  // }

  // getEditUsuarios(UsuariosFromProvider fromProvider, String idl,
  //     BuildContext context) async {
  //   String id = idl;
  //   String nombre = fromProvider.nombre;
  //   String direccion = fromProvider.direccion;
  //   String telefono = fromProvider.telefono;
  //   String celular = fromProvider.celular;
  //   String ciudad = fromProvider.ciudad;
  //   String departamento = fromProvider.departamento;
  //   String correo = fromProvider.correo;
  //   String rol = fromProvider.rol;
  //   String estado = fromProvider.estado;

  //   String url =
  //       'manager.php?case=3&id=$id&nombre=$nombre&direccion=$direccion&telefono=$telefono&celular=$celular&ciudad=$ciudad&departamento=$departamento&correo=$correo&rol=$rol&estado=$estado&idVende=$idVende';
  //   print(AllApi.url + url);
  //   final resp = await AllApi.httpGet(url);
  //   final dataMap = jsonDecode(resp);
  //   final Usuarios usuarios = Usuarios.fromlist(dataMap['rpta']);
  //   print(resp);
  //   if (usuarios.dato.isNotEmpty) {
  //     this.usuarios = usuarios.dato;
  //     this.idVendedorSelect = '0';
  //     this.nameVendedorSelect = 'Vendedor';
  //     Navigator.pop(context);
  //   }
  //   notifyListeners();
  // }

  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    usuarios.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;
    notifyListeners();
  }
}
