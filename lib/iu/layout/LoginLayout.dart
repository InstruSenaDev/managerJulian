// ignore_for_file: file_names
import 'package:flutter/material.dart';

class LoginLayout extends StatelessWidget {
  final Widget child;

  const LoginLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
              width: size.width,
              height: size.height,
              // color: Colors.amber,
              child: const Image(
                image: AssetImage('img/fondo.jpg'),
                fit: BoxFit.cover,
              )),
          Container(child: child)
        ],
      ),
    );
  }
}
