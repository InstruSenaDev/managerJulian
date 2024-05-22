import 'package:flutter/material.dart';

class PedidosView extends StatelessWidget {
  const PedidosView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.red,
      child: const Center(
        child: Text(
          'pedidos',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
