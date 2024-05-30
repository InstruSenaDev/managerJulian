// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../api/AllApi.dart';
import '../../modelo/Recomendaciones/RecomendacionesModels.dart';

class RecomendacionesProvider extends ChangeNotifier {
  List<Recomendacion> recomendaciones = [];
  late Recomendacion isSelectRecomendaciones;
  String idRecomendacionesSelect = '0';
  String nameRecomendacionesSelect = 'Vendedor';

  bool ascending = true;
  int? sortColumnIndex;

  asignaDateRecomendaciones(String id, String name) {
    idRecomendacionesSelect = id;
    nameRecomendacionesSelect = name;
    notifyListeners();
  }

  getRecomendaciones(int i) async {
    String url = 'admin/web_admin_recomendaciones.php?case=1&date=$i';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    final Recomendaciones recomendaciones =
        Recomendaciones.fromlist(dataMap['rpta']);
    print(resp);
    if (recomendaciones.dato.isNotEmpty) {
      this.recomendaciones = recomendaciones.dato;
    }
    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(Recomendacion user) getField) {
    recomendaciones.sort((a, b) {
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
