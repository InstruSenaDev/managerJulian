// ignore_for_file: file_names
class Usuarios {
  List<Usuario> dato = [];
  Usuarios();

  Usuarios.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = Usuario.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}
// $result['rp']='si';
// $result['id']=$registro['id'];
// $result['nombres']=$registro['nombres'];
// $result['apellidos']=$registro['apellidos'];//descripcion
// $result['tipoDocumento ']=$registro['tipoDocumento '];//descripcion
// $result['documento']=$registro['documento'];
// $result['correo']=$registro['correo'];
// $result['celular']=$registro['celular'];
// $result['pin']=$registro['pin'];
// $result['rol']=$registro['rol'];
// $result['estado']=$registro['estado'];
// $result['colorEstado']=$registro['colorEstado'];
// $result['esta']=$registro['esta'];
// $result['rolname']=$registro['rolname'];

class Usuario {
  String? rp;
  String? id;
  String? nombres;
  String? apellidos;
  String? tipoDocumento;
  String? documento;
  String? correo;
  String? celular;
  String? pin;
  String? rol;
  String? estado;
  String? colorEstado;
  String? esta;
  String? rolname;

  Usuario({
    this.rp,
    this.id,
    this.nombres,
    this.apellidos,
    this.tipoDocumento,
    this.documento,
    this.correo,
    this.celular,
    this.pin,
    this.rol,
    this.estado,
    this.colorEstado,
    this.esta,
    this.rolname,
  });

  Usuario.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'].toString();
    id = datos['id'].toString();
    nombres = datos['nombres'].toString();
    apellidos = datos['apellidos'].toString();
    tipoDocumento = datos['tipoDocumento'].toString();
    documento = datos['documento'].toString();
    correo = datos['correo'].toString();
    celular = datos['celular'].toString();
    pin = datos['pin'].toString();
    rol = datos['rol'].toString();
    estado = datos['estado'].toString();
    colorEstado = datos['colorEstado'].toString();
    esta = datos['esta'].toString();
    rolname = datos['rolname'].toString();
  }
}
