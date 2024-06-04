import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managerapp/iu/views/Centros/CentrosDTS.dart';
import 'package:provider/provider.dart';

import '../../../Provider/Centros/CentrosProvider.dart';
import '../../../inputs/customIconButton.dart';

class CentrosPages extends StatefulWidget {
  const CentrosPages({super.key});

  @override
  State<CentrosPages> createState() => _CentrosPagesState();
}

class _CentrosPagesState extends State<CentrosPages> {
  @override
  void initState() {
    Provider.of<CentrosProvider>(context, listen: false).getCentros();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final centros = Provider.of<CentrosProvider>(context);
    // int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
    final size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.red,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: (centros.centro.isEmpty)
            ? SpinKitThreeBounce(
                color: Color(0xffC81966),
                size: 50.0,
              )
            : ListView(
                children: [
                  Text(
                    'Centros',
                    style: GoogleFonts.roboto(
                        fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PaginatedDataTable(
                    sortAscending: centros.ascending,
                    sortColumnIndex: centros.sortColumnIndex,
                    rowsPerPage: (centros.centro.isNotEmpty)
                        ? centros.centro.length + 4
                        : 25,
                    actions: [
                      CustomIconButton(
                        width: size.width * 0.1,
                        height: 40,
                        colorText: Colors.white,
                        onPressd: () {},
                        text: 'Agregar Centro',
                        color: Colors.green,
                        icon: Icons.person_add_alt,
                      )
                    ],
                    header: const Text(
                      // titulo de la tabla
                      'Listado de centros',
                      maxLines: 2,
                    ),
                    arrowHeadColor: Color(0xff154360),
                    columns: [
                      DataColumn(
                          label: const Text('Centro',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            centros.sortColumnIndex = colIndex;
                            centros.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Teléfono',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            centros.sortColumnIndex = colIndex;
                            centros.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Ubicación',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            centros.sortColumnIndex = colIndex;
                            centros.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Tipo',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            centros.sortColumnIndex = colIndex;
                            centros.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Ciudad',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            centros.sortColumnIndex = colIndex;
                            centros.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Estado',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            centros.sortColumnIndex = colIndex;
                            centros.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Acciones',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            centros.sortColumnIndex = colIndex;
                            centros.sort<String>((user) => user.id!);
                          }),
                    ],
                    source: CentrosDTS(centros.centro, context, centros),
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
