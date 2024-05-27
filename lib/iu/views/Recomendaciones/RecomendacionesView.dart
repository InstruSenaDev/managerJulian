import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managerapp/Provider/Recomendaciones/RecomendacionesProvider.dart';
import 'package:provider/provider.dart';

import '../../../inputs/customIconButton.dart';
import 'RecomendacionesDTS.dart';

class RecomendacionesPages extends StatefulWidget {
  const RecomendacionesPages({super.key});

  @override
  State<RecomendacionesPages> createState() => _RecomendacionesPagesState();
}

class _RecomendacionesPagesState extends State<RecomendacionesPages> {
  @override
  void initState() {
    Provider.of<RecomendacionesProvider>(context, listen: false)
        .getRecomendaciones();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecomendacionesProvider>(context);
    final size = MediaQuery.of(context).size;

    return Container(
      // color: Colors.red,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: (provider.recomendaciones.isEmpty)
            ? SpinKitThreeBounce(
                color: Color(0xffC81966),
                size: 50.0,
              )
            : ListView(
                children: [
                  Text(
                    'Recomendaciones',
                    style: GoogleFonts.roboto(
                        fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PaginatedDataTable(
                    sortAscending: provider.ascending,
                    sortColumnIndex: provider.sortColumnIndex,
                    rowsPerPage: (provider.recomendaciones.isNotEmpty)
                        ? provider.recomendaciones.length + 4
                        : 25,
                    actions: [
                      CustomIconButton(
                        width: size.width * 0.13,
                        height: 40,
                        colorText: Colors.white,
                        onPressd: () {},
                        text: 'Agregar Recomendación',
                        color: Colors.green,
                        icon: Icons.person_add_alt,
                      )
                    ],
                    header: Row(
                      children: [
                        Text(
                          // titulo de la tabla
                          'Listado de Recomendaciones',
                          maxLines: 2,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: 100,
                          height: 45,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 100,
                          height: 45,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 100,
                          height: 45,
                          color: Colors.red,
                        )
                      ],
                    ),
                    arrowHeadColor: Color(0xff154360),
                    columns: [
                      DataColumn(
                          label: const Text('Tipo',
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
                          label: const Text('Procedimiento',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            provider.sortColumnIndex = colIndex;
                            provider.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Recomendación',
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
                    source: RecomendacionesDTS(
                        provider.recomendaciones, context, provider),
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
