import 'package:flutter/material.dart';
import 'package:managerapp/Provider/Recomendaciones/RecomendacionesProvider.dart';
import 'package:managerapp/modelo/Recomendaciones/RecomendacionesModels.dart';

class RecomendacionesDTS extends DataTableSource {
  final List<Recomendacion> recomendaciones;
  final BuildContext context;
  final RecomendacionesProvider provider;

  RecomendacionesDTS(
    this.recomendaciones,
    this.context,
    this.provider,
  );

  @override
  DataRow getRow(int index) {
    final recomendacion = recomendaciones[index];
    final size = MediaQuery.of(context).size;

    return DataRow.byIndex(index: index, cells: [
      DataCell(Container(
          width: 190,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
            color: Color(int.parse("0x50${recomendacion.colorTipo}")),
            borderRadius: BorderRadius.circular(150),
          ),
          child: Text(
            recomendacion.tipo!,
            style: TextStyle(
                color: Color(int.parse("0xff${recomendacion.colorTipo}"))),
          ))),
      DataCell(Text(recomendacion.procedimiento!)),
      DataCell(Container(
          width: size.width * 0.3,
          child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              recomendacion.recomendacion!))),
      DataCell(Container(
        width: 80,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            color: Color(int.parse("0x50${recomendacion.colorEstado}"))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: Color(int.parse("0xff${recomendacion.colorEstado}")),
                  borderRadius: BorderRadius.circular(150)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(recomendacion.estado!,
                style: TextStyle(
                    fontSize: 13,
                    color:
                        Color(int.parse("0xff${recomendacion.colorEstado}"))))
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
  int get rowCount => recomendaciones.length;

  @override
  int get selectedRowCount => 0;
}
