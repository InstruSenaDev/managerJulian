import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managerapp/Provider/Foro/ForoProvider.dart';
import 'package:provider/provider.dart';

import 'ForosDTS.dart';

class ForosPages extends StatefulWidget {
  const ForosPages({super.key});

  @override
  State<ForosPages> createState() => _ForosPagesState();
}

class _ForosPagesState extends State<ForosPages> {
  @override
  void initState() {
    Provider.of<ForoProvider>(context, listen: false).getForos(0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ForoProvider>(context);

    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      child: (provider.foros.isEmpty)
          ? const SpinKitThreeBounce(
              color: Color(0xffC81966),
              size: 50.0,
            )
          : ListView(
              children: [
                Text(
                  'Foros',
                  style: GoogleFonts.roboto(
                      fontSize: 30, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                PaginatedDataTable(
                  sortAscending: provider.ascending,
                  sortColumnIndex: provider.sortColumnIndex,
                  rowsPerPage:
                      (provider.foros.isNotEmpty) ? provider.foros.length : 25,
                  header: RadioButtonsRow(
                    provider: provider,
                  ),
                  arrowHeadColor: const Color(0xff154360),
                  columns: [
                    DataColumn(
                        label: const Text('Titulo',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        onSort: (colIndex, _) {
                          provider.sortColumnIndex = colIndex;
                          provider.sort<String>((user) => user.id!);
                        }),
                    DataColumn(
                        label: const Text('Nombre',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        onSort: (colIndex, _) {
                          provider.sortColumnIndex = colIndex;
                          provider.sort<String>((user) => user.id!);
                        }),
                    DataColumn(
                        label: const Text('Comentario',
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
                  source: ForosDTS(provider.foros, context, provider),
                  onPageChanged: (page) {
                    print(page);
                  },
                )
              ],
            ),
    );
  }
}

class RadioButtonsRow extends StatefulWidget {
  final ForoProvider provider;
  const RadioButtonsRow({super.key, required this.provider});

  @override
  _RadioButtonsRowState createState() => _RadioButtonsRowState();
}

class _RadioButtonsRowState extends State<RadioButtonsRow> {
  int? _selectedRadio = 0;

  void _handleRadioValueChange(int? value) {
    setState(() {
      widget.provider.getForos(value!);
      _selectedRadio = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 130,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: const Color(0x503498DB),
              borderRadius: BorderRadius.circular(150)),
          child: Row(
            children: [
              Radio(
                fillColor: MaterialStateProperty.all(const Color(0xff3498DB)),
                value: 1,
                groupValue: _selectedRadio,
                onChanged: _handleRadioValueChange,
              ),
              const Text(
                'Enviado',
                style: TextStyle(fontSize: 15, color: Color(0xff3498DB)),
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
              color: const Color(0x502ECC71),
              borderRadius: BorderRadius.circular(150)),
          child: Row(
            children: [
              Radio(
                fillColor: MaterialStateProperty.all(const Color(0xff2ECC71)),
                value: 2,
                groupValue: _selectedRadio,
                onChanged: _handleRadioValueChange,
              ),
              const Text(
                'Aprovado',
                style: TextStyle(fontSize: 15, color: Color(0xff2ECC71)),
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
              color: const Color(0x50E74C3C),
              borderRadius: BorderRadius.circular(150)),
          child: Row(
            children: [
              Radio(
                fillColor: MaterialStateProperty.all(const Color(0xffE74C3C)),
                value: 3,
                groupValue: _selectedRadio,
                onChanged: _handleRadioValueChange,
              ),
              const Text(
                'Rechazado',
                style: TextStyle(fontSize: 15, color: Color(0xffE74C3C)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
