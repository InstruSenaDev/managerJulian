import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managerapp/Provider/Procedimientos/ProcedimientosProvider.dart';
import 'package:managerapp/iu/views/Procedimientos/ProcedimientosDTS.dart';
import 'package:provider/provider.dart';

import '../../../inputs/customIconButton.dart';

class ProcedimientosView extends StatefulWidget {
  const ProcedimientosView({super.key});

  @override
  State<ProcedimientosView> createState() => _ProcedimientosViewState();
}

class _ProcedimientosViewState extends State<ProcedimientosView> {
  @override
  void initState() {
    Provider.of<ProcedimientosProvider>(context, listen: false)
        .getProcedimiento();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProcedimientosProvider>(context);

    final size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.red,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: (provider.procedimiento.isEmpty)
            ? SpinKitThreeBounce(
                color: Color(0xffC81966),
                size: 50.0,
              )
            : ListView(
                children: [
                  Text(
                    'Procedimientos',
                    style: GoogleFonts.roboto(
                        fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PaginatedDataTable(
                    sortAscending: provider.ascending,
                    sortColumnIndex: provider.sortColumnIndex,
                    rowsPerPage: (provider.procedimiento.isNotEmpty)
                        ? provider.procedimiento.length + 4
                        : 25,
                    actions: [
                      CustomIconButton(
                        width: size.width * 0.12,
                        height: 40,
                        colorText: Colors.white,
                        onPressd: () {},
                        text: 'Agregar Procedimiento',
                        color: Colors.green,
                        icon: Icons.person_add_alt,
                      )
                    ],
                    header: const Text(
                      // titulo de la tabla
                      'Listado de Procedimientos',
                      maxLines: 2,
                    ),
                    arrowHeadColor: Color(0xff154360),
                    columns: [
                      DataColumn(
                          label: const Text('Procedimiento',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            provider.sortColumnIndex = colIndex;
                            provider.sort<String>((user) => user.id!);
                          }),
                      // DataColumn(
                      //     label: const Text('Descripción',
                      //         style: TextStyle(fontWeight: FontWeight.bold)),
                      //     onSort: (colIndex, _) {
                      //       provider.sortColumnIndex = colIndex;
                      //       provider.sort<String>((user) => user.id!);
                      //     }),
                      DataColumn(
                          label: const Text('Cuerpo',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            provider.sortColumnIndex = colIndex;
                            provider.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Tipo',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            provider.sortColumnIndex = colIndex;
                            provider.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Estado',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            provider.sortColumnIndex = colIndex;
                            provider.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                        
                          label: const Text('Acciones',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            provider.sortColumnIndex = colIndex;
                            provider.sort<String>((user) => user.id!);
                          }),
                    ],
                    source: ProcedimientosDTS(
                        provider.procedimiento, context, provider),
                    onPageChanged: (page) {
                      print(page);
                    },
                  )
                ],
              ),
      ),
    );
  }
}
