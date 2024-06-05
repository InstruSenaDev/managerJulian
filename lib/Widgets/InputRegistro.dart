import 'package:flutter/material.dart';

import '../Provider/Usuarios/UsuarioFromProvider.dart';

class InputRegistro {
  static inputNombre(String textLabel, String textExample, IconData icon,
      BuildContext context, UsuariosFromProvider provider, TextInputType name) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(
                    icon,
                    color: const Color(0xff718EBF),
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: name,
                    onChanged: (value) => provider.nombre = value.trim(),
                    decoration: decorationInput(textLabel),
                    style: TextStyle(
                      color: Color(0xff718EBF),
                    ),
                    cursorColor: const Color(0xff718EBF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static inputDocumento(
      String textLabel,
      String textExample,
      IconData icon,
      BuildContext context,
      UsuariosFromProvider provider,
      TextInputType number) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffDFEAF2),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(
                    icon,
                    color: const Color(0xff718EBF),
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: number,
                    onChanged: (value) => provider.documento = value.trim(),
                    decoration: decorationInput(textLabel),
                    style: TextStyle(
                      color: Colors.grey[900],
                    ),
                    cursorColor: const Color(0xff718EBF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static inputCelular(
      String textLabel,
      String textExample,
      IconData icon,
      BuildContext context,
      UsuariosFromProvider provider,
      TextInputType phone) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffDFEAF2),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(
                    icon,
                    color: const Color(0xff718EBF),
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: phone,
                    onChanged: (value) => provider.celular = value.trim(),
                    decoration: decorationInput(textLabel),
                    style: TextStyle(
                      color: Colors.grey[900],
                    ),
                    cursorColor: const Color(0xff718EBF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static inputCorreo(
      String textLabel,
      String textExample,
      IconData icon,
      BuildContext context,
      UsuariosFromProvider provider,
      TextInputType emailAddress) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffDFEAF2),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(
                    icon,
                    color: const Color(0xff718EBF),
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: emailAddress,
                    onChanged: (value) => provider.correo = value.trim(),
                    decoration: decorationInput(textLabel),
                    style: TextStyle(
                      color: Colors.grey[900],
                    ),
                    cursorColor: const Color(0xff718EBF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static inputDireccion(
      String textLabel,
      String textExample,
      IconData icon,
      BuildContext context,
      UsuariosFromProvider provider,
      TextInputType emailAddress) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffbf001e),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(
                    icon,
                    color: const Color(0xffbf001e),
                  ),
                ),
                Expanded(
                  child: TextField(
                    keyboardType: emailAddress,
                    onChanged: (value) => provider.direccion = value.trim(),
                    decoration: decorationInput(textLabel),
                    style: TextStyle(
                      color: Colors.grey[900],
                    ),
                    cursorColor: const Color(0xffbf001e),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static inputPassword(
      String textLabel,
      String textExample,
      IconData icon,
      BuildContext context,
      UsuariosFromProvider provider,
      TextInputType emailAddress) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffbf001e),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(
                    icon,
                    color: const Color(0xffbf001e),
                  ),
                ),
                Expanded(
                  child: TextField(
                    obscureText: true,
                    keyboardType: emailAddress,
                    onChanged: (value) => provider.contrasena = value.trim(),
                    decoration: decorationInput(textLabel),
                    style: TextStyle(
                      color: Colors.grey[900],
                    ),
                    cursorColor: const Color(0xffbf001e),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static inputBarrio(
      String textLabel,
      String textExample,
      IconData icon,
      BuildContext context,
      UsuariosFromProvider provider,
      TextInputType emailAddress,
      Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: Container(
        margin: const EdgeInsets.only(top: 2),
        decoration: BoxDecoration(
          // color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xffbf001e),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Icon(
                icon,
                color: const Color(0xffbf001e),
              ),
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.centerLeft,
                  height: 42,
                  child: Text(textLabel,
                      style: TextStyle(color: color, fontSize: 16))),
            ),
          ],
        ),
      ),
    );
  }

  static inputCiudad(
      String textLabel,
      String textExample,
      IconData icon,
      BuildContext context,
      UsuariosFromProvider provider,
      TextInputType emailAddress,
      Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: Container(
        margin: const EdgeInsets.only(top: 2),
        decoration: BoxDecoration(
          // color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xffbf001e),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Icon(
                icon,
                color: const Color(0xffbf001e),
              ),
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.centerLeft,
                  height: 42,
                  child: Text(textLabel,
                      style: TextStyle(color: color, fontSize: 16))),
            ),
          ],
        ),
      ),
    );
  }

  static decorationInput(String textLabel) {
    return InputDecoration(
      label: Text(textLabel),
      labelStyle: TextStyle(color: Color(0xff718EBF)),
      hintText: textLabel,
      hintStyle: TextStyle(
        color: Color(0xff718EBF),
      ),
      border: InputBorder.none,
      contentPadding: const EdgeInsets.all(5),
    );
  }
}
