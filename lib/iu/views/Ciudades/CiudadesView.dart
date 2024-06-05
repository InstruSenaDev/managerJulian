import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managerapp/Provider/Ciudades/CiudadesProvider.dart';
import 'package:managerapp/Provider/Clientes/ClientesProvider.dart';
import 'package:managerapp/iu/views/Clientes/ClientesDTS.dart';
import 'package:provider/provider.dart';

import '../../../inputs/customIconButton.dart';
import 'CiudadesDTS.dart';

class CiudadesView extends StatefulWidget {
  const CiudadesView({super.key});

  @override
  State<CiudadesView> createState() => _CiudadesViewState();
}

class _CiudadesViewState extends State<CiudadesView> {
  @override
  void initState() {
    Provider.of<CiudadesProvider>(context, listen: false).getCiudades();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ciudades = Provider.of<CiudadesProvider>(context);
    // int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
    final size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.red,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: (ciudades.ciudades.isEmpty)
            ? SpinKitThreeBounce(
                color: Color(0xffC81966),
                size: 50.0,
              )
            : ListView(
                children: [
                  Text(
                    'Ciudades',
                    style: GoogleFonts.roboto(
                        fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PaginatedDataTable(
                    sortAscending: ciudades.ascending,
                    sortColumnIndex: ciudades.sortColumnIndex,
                    rowsPerPage: (ciudades.ciudades.isNotEmpty)
                        ? ciudades.ciudades.length + 4
                        : 25,
                    actions: [
                      CustomIconButton(
                        width: size.width * 0.1,
                        height: 40,
                        colorText: Colors.white,
                        onPressd: () {},
                        text: 'Agregar ciudad',
                        color: Colors.green,
                        icon: Icons.location_city_outlined,
                      )
                    ],
                    header: const Text(
                      // titulo de la tabla
                      'Listado de Ciudades',
                      maxLines: 2,
                    ),
                    arrowHeadColor: Color(0xff154360),
                    columns: [
                      DataColumn(
                          label: const Text('Ciudad',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            ciudades.sortColumnIndex = colIndex;
                            ciudades.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Pais',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            ciudades.sortColumnIndex = colIndex;
                            ciudades.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Estado',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            ciudades.sortColumnIndex = colIndex;
                            ciudades.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Acciones',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            ciudades.sortColumnIndex = colIndex;
                            ciudades.sort<String>((user) => user.id!);
                          }),
                    ],
                    source: CiudadesDTS(ciudades.ciudades, context, ciudades),
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
