import 'package:flutter/material.dart';
import 'package:managerapp/Provider/Foro/ForoProvider.dart';

import '../../../modelo/Foros/ForosModels.dart';

class ForosDTS extends DataTableSource {
  final List<Foro> foros;
  final BuildContext context;
  final ForoProvider provider;

  ForosDTS(
    this.foros,
    this.context,
    this.provider,
  );

  @override
  DataRow getRow(int index) {
    final foro = foros[index];
    final size = MediaQuery.of(context).size;

    return DataRow.byIndex(index: index, cells: [
      DataCell(Container(
          width: size.width * 0.1,
          child: Text(
            overflow: TextOverflow.ellipsis,
            foro.titulo!,
            maxLines: 2,
          ))),
      DataCell(Container(
          width: size.width * 0.1,
          child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              '${foro.nombres!} ${foro.nombres!}'))),
      DataCell(Container(
          width: size.width * 0.3,
          child: Text(
              maxLines: 2, overflow: TextOverflow.ellipsis, foro.comentario!))),
      DataCell(Container(
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            color: Color(int.parse("0x50${foro.color}"))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: Color(int.parse("0xff${foro.color}")),
                  borderRadius: BorderRadius.circular(150)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(foro.estado!,
                style: TextStyle(
                    fontSize: 13, color: Color(int.parse("0xff${foro.color}"))))
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
  int get rowCount => foros.length;

  @override
  int get selectedRowCount => 0;
}
