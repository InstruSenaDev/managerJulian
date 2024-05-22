import 'package:flutter/material.dart';

class ProcedimientosView extends StatelessWidget {
  const ProcedimientosView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.red,
      child: const Center(
        child: Text(
          'Procedimientos',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
