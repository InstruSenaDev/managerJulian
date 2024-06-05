import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Provider/Clientes/ClientesFromProvider.dart';
import '../../../Provider/Clientes/ClientesProvider.dart';
import '../../../Provider/Usuarios/UsuarioFromProvider.dart';
import '../../../Widgets/InputRegistro.dart';
import '../../../inputs/customIconButton.dart';

class NuevoCliente extends StatefulWidget {
  const NuevoCliente({super.key});

  @override
  State<NuevoCliente> createState() => _NuevoClienteState();
}

class _NuevoClienteState extends State<NuevoCliente> {
  @override
  void initState() {
    Provider.of<ClienteProvider>(context, listen: false).getCiudades();
    Provider.of<ClienteProvider>(context, listen: false).getTiposDocumentos();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final fromProvider = Provider.of<ClientesFromProvider>(context);
    final provider = Provider.of<ClienteProvider>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fa),
      body: Container(
        height: size.height * 0.8,
        padding: const EdgeInsets.all(30),
        margin: EdgeInsets.only(
            top: size.width * 0.05,
            left: size.width * 0.2,
            right: size.width * 0.2),
        decoration: BoxDecoration(
            boxShadow: [const BoxShadow(color: Colors.black26, blurRadius: 2)],
            color: Colors.white,
            borderRadius: BorderRadius.circular(16)),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                'Nuevo usuario',
                style: GoogleFonts.roboto(
                    fontSize: 30, fontWeight: FontWeight.w400),
              ),
            ),
            InputRegistro.inputNombre('Nombre', 'Nombre', Icons.person_outlined,
                context, fromProvider, TextInputType.name),
            const SizedBox(
              height: 15,
            ),
            InputRegistro.inputNombre(
                'Apellido',
                'Apellido',
                Icons.person_outlined,
                context,
                fromProvider,
                TextInputType.name),
            const SizedBox(
              height: 15,
            ),
            TipoDocumento(
              provider: provider,
            ),
            const SizedBox(
              height: 15,
            ),
            InputRegistro.inputDocumento(
                'Documento',
                'Documento',
                Icons.person_outlined,
                context,
                fromProvider,
                TextInputType.name),
            const SizedBox(
              height: 15,
            ),
            InputRegistro.inputCorreo('Correo', 'Correo', Icons.email_outlined,
                context, fromProvider, TextInputType.name),
            const SizedBox(
              height: 15,
            ),
            InputRegistro.inputCelular(
                'Celular',
                'Celular',
                Icons.phone_android_rounded,
                context,
                fromProvider,
                TextInputType.name),
            const SizedBox(
              height: 15,
            ),
            Ciudad(
              provider: provider,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.185),
              child: CustomIconButton(
                  width: size.width * 0.1,
                  height: 40,
                  colorText: Colors.white,
                  onPressd: () {
                    fromProvider.pin = generarCodigo();

                    if (fromProvider.validateNull()) {
                      provider.getNewUsuarios(fromProvider, context);
                    }
                  },
                  text: 'Guardar',
                  color: Colors.green,
                  icon: Icons.add),
            )
          ],
        ),
      ),
    );
  }

  String generarCodigo() {
    // Generar letras aleatorias
    String letras = '';
    var random = Random();
    for (int i = 0; i < 3; i++) {
      letras += String.fromCharCode(random.nextInt(26) + 65);
    }

    // Generar números aleatorios
    String numeros = '';
    for (int i = 0; i < 3; i++) {
      numeros += random.nextInt(10).toString();
    }

    // Mezclar letras y números
    var codigo = letras + numeros;

    return codigo;
  }
}

class TipoDocumento extends StatelessWidget {
  final ClienteProvider provider;
  const TipoDocumento({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fromProvider = Provider.of<ClientesFromProvider>(context);

    return InkWell(
      onTap: () {
        selectTipoDocumento(size, context, fromProvider);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 52,
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1.5,
                  color: const Color(0xffDFEAF2),
                ),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.badge_outlined,
                      color: Color(0xff718EBF),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    provider.isSelectParametro,
                    style: TextStyle(
                        color: const Color(0xff718EBF),
                        fontSize: 17,
                        fontWeight:
                            (provider.isSelectParametro != 'Tipo de documento')
                                ? FontWeight.bold
                                : FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectTipoDocumento(
      Size size, BuildContext context, ClientesFromProvider fromProvider) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Container(
              alignment: Alignment.center,
              // color: Colors.red,
              child: const Text(
                textAlign: TextAlign.center,
                'Tipo de Documento',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            contentPadding: const EdgeInsets.all(2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            content: Container(
              // color: Colors.red,
              width: size.width * 0.2,
              height: provider.ciudades.length * 80,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                shrinkWrap: true,
                children: ListTile.divideTiles(
                        color: Colors.grey,
                        tiles: provider.parametro
                            .map((e) => InkWell(
                                  onTap: () {
                                    // provider.progress();

                                    fromProvider.tipoDocumento = e.id!;

                                    provider.asignaDateParametro(
                                        e.id!, e.parametro!);
                                    Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    title: Text(
                                      e.parametro!,
                                      style: const TextStyle(
                                        color: Color(0xff718EBF),
                                        fontSize: 18,
                                      ),
                                    ),
                                    trailing:
                                        const Icon(Icons.arrow_forward_ios),
                                  ),
                                ))
                            .toList())
                    .toList(),
              ),
            ),
          );
        });
  }
}

class Ciudad extends StatelessWidget {
  final ClienteProvider provider;

  const Ciudad({
    super.key,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fromProvider = Provider.of<ClientesFromProvider>(context);

    return InkWell(
      onTap: () {
        selectCiudad(size, context, fromProvider);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 52,
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1.5,
                  color: const Color(0xffDFEAF2),
                ),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.location_city_outlined,
                      color: Color(0xff718EBF),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    provider.isSelectCiudad,
                    style: TextStyle(
                        color: const Color(0xff718EBF),
                        fontSize: 17,
                        fontWeight: (provider.isSelectCiudad != 'Ciudad')
                            ? FontWeight.bold
                            : FontWeight.w400),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectCiudad(
      Size size, BuildContext context, ClientesFromProvider fromProvider) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Container(
              alignment: Alignment.center,
              // color: Colors.red,
              child: const Text(
                textAlign: TextAlign.center,
                'Ciudad',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            contentPadding: const EdgeInsets.all(2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            content: Container(
              // color: Colors.red,
              width: size.width * 0.2,
              height: provider.ciudades.length * 80,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                shrinkWrap: true,
                children: ListTile.divideTiles(
                        color: Colors.grey,
                        tiles: provider.ciudades
                            .map((e) => InkWell(
                                  onTap: () {
                                    // provider.progress();

                                    fromProvider.ciudad = e.id!;

                                    provider.asignaDateCiudades(
                                        e.id!, e.ciudad!);
                                    Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    title: Text(
                                      e.ciudad!,
                                      style: const TextStyle(
                                        color: Color(0xff718EBF),
                                        fontSize: 18,
                                      ),
                                    ),
                                    trailing:
                                        const Icon(Icons.arrow_forward_ios),
                                  ),
                                ))
                            .toList())
                    .toList(),
              ),
            ),
          );
        });
  }
}
