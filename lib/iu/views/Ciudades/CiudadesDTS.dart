import 'package:flutter/material.dart';
import 'package:managerapp/Provider/Ciudades/CiudadesProvider.dart';
import 'package:managerapp/Provider/Clientes/ClientesProvider.dart';

import 'package:managerapp/modelo/Usuarios/UsuariosModels.dart';

import '../../../modelo/Ciudades/CiudadesModels.dart';

class CiudadesDTS extends DataTableSource {
  final List<Ciudad> ciudades;
  final BuildContext context;
  final CiudadesProvider provider;

  CiudadesDTS(this.ciudades, this.context, this.provider);

  @override
  DataRow getRow(int index) {
    final ciudad = ciudades[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(ciudad.ciudad!)),
      DataCell(Text(ciudad.pais!)),
      DataCell(Container(
        width: 80,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            color: Color(int.parse("0x50${ciudad.color}"))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: Color(int.parse("0xff${ciudad.color}")),
                  borderRadius: BorderRadius.circular(150)),
            ),
            SizedBox(
              width: 10,
            ),
            Text(ciudad.estado!,
                style: TextStyle(
                    fontSize: 13,
                    color: Color(int.parse("0xff${ciudad.color}")))),
          ],
        ),
      )),
      const DataCell(Row(
        children: [
          Icon(
            Icons.remove_red_eye_outlined,
            color: Colors.blue,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.delete_outline_rounded,
            color: Colors.red,
          )
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => ciudades.length;

  @override
  int get selectedRowCount => 0;
}
