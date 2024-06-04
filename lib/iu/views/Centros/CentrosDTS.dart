import 'package:flutter/material.dart';
import 'package:managerapp/Provider/Centros/CentrosProvider.dart';

import '../../../modelo/Centros/CentrosModels.dart';

class CentrosDTS extends DataTableSource {
  final List<Centro> centros;
  final BuildContext context;
  final CentrosProvider provider;

  CentrosDTS(
    this.centros,
    this.context,
    this.provider,
  );

  @override
  DataRow getRow(int index) {
    final centro = centros[index];
    final size = MediaQuery.of(context).size;

    return DataRow.byIndex(index: index, cells: [
      DataCell(Container(
          width: size.width * 0.1,
          child: Text(
            overflow: TextOverflow.ellipsis,
            centro.centro!,
            maxLines: 2,
          ))),
      DataCell(Container(
          width: size.width * 0.1,
          child: Text(
              maxLines: 2, overflow: TextOverflow.ellipsis, centro.telefono!))),
      DataCell(Container(
          child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              centro.ubicacion!))),
      DataCell(Container(
          child: Text(
              maxLines: 2, overflow: TextOverflow.ellipsis, centro.tipo!))),
      DataCell(Container(
          child: Text(
              maxLines: 2, overflow: TextOverflow.ellipsis, centro.ciudad!))),
      DataCell(Container(
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            color: Color(int.parse("0x50${centro.colorEstado}"))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: Color(int.parse("0xff${centro.colorEstado}")),
                  borderRadius: BorderRadius.circular(150)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(centro.estado!,
                style: TextStyle(
                    fontSize: 13,
                    color: Color(int.parse("0xff${centro.colorEstado}"))))
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
  int get rowCount => centros.length;

  @override
  int get selectedRowCount => 0;
}
