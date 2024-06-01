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
        .getRecomendaciones(0);

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
            ? const SpinKitThreeBounce(
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
                    header: RadioButtonsRow(
                      provider: provider,
                    ),
                    arrowHeadColor: const Color(0xff154360),
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

class RadioButtonsRow extends StatefulWidget {
  final RecomendacionesProvider provider;
  const RadioButtonsRow({super.key, required this.provider});

  @override
  _RadioButtonsRowState createState() => _RadioButtonsRowState();
}

class _RadioButtonsRowState extends State<RadioButtonsRow> {
  int? _selectedRadio = 0;

  void _handleRadioValueChange(int? value) {
    setState(() {
      widget.provider.getRecomendaciones(value!);
      _selectedRadio = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 190,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: const Color(0x504D53A0),
              borderRadius: BorderRadius.circular(150)),
          child: Row(
            children: [
              Radio(
                fillColor: MaterialStateProperty.all(const Color(0xff4D53A0)),
                value: 1,
                groupValue: _selectedRadio,
                onChanged: _handleRadioValueChange,
              ),
              const Text(
                'Pre Quirúrgico',
                style: TextStyle(fontSize: 15, color: Color(0xff4D53A0)),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          // width: 250,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: const Color(0x50F2326B),
              borderRadius: BorderRadius.circular(150)),
          child: Row(
            children: [
              Radio(
                fillColor: MaterialStateProperty.all(const Color(0xffF2326B)),
                value: 2,
                groupValue: _selectedRadio,
                onChanged: _handleRadioValueChange,
              ),
              const Text(
                'Pos Quirúrgico Inmediato',
                style: TextStyle(fontSize: 15, color: Color(0xffF2326B)),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: const Color(0x507C457E),
              borderRadius: BorderRadius.circular(150)),
          child: Row(
            children: [
              Radio(
                fillColor: MaterialStateProperty.all(const Color(0xff7C457E)),
                value: 3,
                groupValue: _selectedRadio,
                onChanged: _handleRadioValueChange,
              ),
              const Text(
                'Pos Quirúrgico en Casa',
                style: TextStyle(fontSize: 15, color: Color(0xff7C457E)),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          width: 130,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(150)),
          child: Row(
            children: [
              Radio(
                fillColor: MaterialStateProperty.all(Colors.grey),
                value: 0,
                groupValue: _selectedRadio,
                onChanged: _handleRadioValueChange,
              ),
              Text(
                'Ver Todo',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
