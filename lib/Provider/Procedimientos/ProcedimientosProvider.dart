// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../api/AllApi.dart';
import '../../modelo/Procedimientos/ProcedimientosModels.dart';

class ProcedimientosProvider extends ChangeNotifier {
  List<Procedimiento> procedimiento = [];
  late Procedimiento isSelectProcedimiento;
  String idVendedorSelect = '0';
  String nameVendedorSelect = 'Vendedor';

  bool ascending = true;
  int? sortColumnIndex;

  asignaDateProcedimiento(String id, String name) {
    idVendedorSelect = id;
    nameVendedorSelect = name;
    notifyListeners();
  }

  getProcedimiento() async {
    String url = 'admin/web_admin_procedimientos.php?case=1';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    final Procedimientos procedimiento =
        Procedimientos.fromlist(dataMap['rpta']);
    print(resp);
    if (procedimiento.dato.isNotEmpty) {
      this.procedimiento = procedimiento.dato;
    }
    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(Procedimiento user) getField) {
    procedimiento.sort((a, b) {
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
