import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managerapp/iu/views/Usuarios/UsuariosDTS.dart';
import 'package:provider/provider.dart';

import '../../../Provider/Usuarios/UsuarioProvider.dart';
import '../../../inputs/customIconButton.dart';

class UsuarioView extends StatefulWidget {
  const UsuarioView({super.key});

  @override
  State<UsuarioView> createState() => _UsuarioViewState();
}

class _UsuarioViewState extends State<UsuarioView> {
  @override
  void initState() {
    Provider.of<UsuariosProvider>(context, listen: false).getUsuarios();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usuarios = Provider.of<UsuariosProvider>(context);
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
                color: Color(0xffC81966),
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
                    source: UsuariosDTS(usuarios.usuarios, context, usuarios),
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
