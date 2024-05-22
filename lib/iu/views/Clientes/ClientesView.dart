import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managerapp/Provider/Clientes/ClientesProvider.dart';
import 'package:managerapp/iu/views/Clientes/ClientesDTS.dart';
import 'package:managerapp/iu/views/Usuarios/UsuariosDTS.dart';
import 'package:provider/provider.dart';

import '../../../Provider/Usuarios/UsuarioProvider.dart';
import '../../../inputs/customIconButton.dart';

class ClientesView extends StatefulWidget {
  const ClientesView({super.key});

  @override
  State<ClientesView> createState() => _ClientesViewState();
}

class _ClientesViewState extends State<ClientesView> {
  @override
  void initState() {
    Provider.of<ClienteProvider>(context, listen: false).getUsuarios();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usuarios = Provider.of<ClienteProvider>(context);
    int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
    final size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.red,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: (usuarios.usuarios.isEmpty)
            ? SpinKitThreeBounce(
                color: Color(0xffd35400),
                size: 50.0,
              )
            : ListView(
                children: [
                  Text(
                    'Usuarios',
                    style: GoogleFonts.roboto(
                        fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PaginatedDataTable(
                    sortAscending: usuarios.ascending,
                    sortColumnIndex: usuarios.sortColumnIndex,
                    rowsPerPage: (usuarios.usuarios.isNotEmpty)
                        ? usuarios.usuarios.length + 4
                        : 25,
                    actions: [
                      CustomIconButton(
                        width: size.width * 0.1,
                        height: 40,
                        colorText: Colors.white,
                        onPressd: () {},
                        text: 'Agregar Usuario',
                        color: Colors.green,
                        icon: Icons.person_add_alt,
                      )
                    ],
                    header: const Text(
                      // titulo de la tabla
                      'Listado de Usuarios',
                      maxLines: 2,
                    ),
                    arrowHeadColor: Color(0xff154360),
                    columns: [
                      DataColumn(
                          label: const Text('Nombre',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            usuarios.sortColumnIndex = colIndex;
                            usuarios.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Ducumento',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            usuarios.sortColumnIndex = colIndex;
                            usuarios.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Correo',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            usuarios.sortColumnIndex = colIndex;
                            usuarios.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Celular',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            usuarios.sortColumnIndex = colIndex;
                            usuarios.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Rol',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            usuarios.sortColumnIndex = colIndex;
                            usuarios.sort<String>((user) => user.id!);
                          }),
                      DataColumn(
                          label: const Text('Estado',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onSort: (colIndex, _) {
                            usuarios.sortColumnIndex = colIndex;
                            usuarios.sort<String>((user) => user.id!);
                          }),
                    ],
                    source: ClienteDTS(usuarios.usuarios, context, usuarios),
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
