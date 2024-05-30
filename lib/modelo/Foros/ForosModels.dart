// ignore_for_file: file_names
class Foros {
  List<Foro> dato = [];
  Foros();

  Foros.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = Foro.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}
// $result['rp']='si';
// $result['id']=$registro['id'];
// $result['titulo']=$registro['titulo'];
// $result['comentario']=$registro['comentario'];//descripcion
// $result['idEstado']=$registro['idEstado'];//descripcion
// $result['estado']=$registro['estado'];//descripcion
// $result['color']=$registro['color'];
// $result['idUsuario']=$registro['idUsuario'];
// $result['nombres']=$registro['nombres'];
// $result['apellidos']=$registro['apellidos'];

class Foro {
  String? rp;
  String? id;
  String? titulo;
  String? comentario;
  String? idEstado;
  String? estado;
  String? color;
  String? idUsuario;
  String? nombres;
  String? apellidos;

  Foro({
    this.rp,
    this.id,
    this.titulo,
    this.comentario,
    this.idEstado,
    this.estado,
    this.color,
    this.idUsuario,
    this.nombres,
    this.apellidos,
  });

  Foro.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'].toString();
    id = datos['id'].toString();
    titulo = datos['titulo'].toString();
    comentario = datos['comentario'].toString();
    idEstado = datos['idEstado'].toString();
    estado = datos['estado'].toString();
    color = datos['color'].toString();
    idUsuario = datos['idUsuario'].toString();
    nombres = datos['nombres'].toString();
    apellidos = datos['apellidos'].toString();
  }
}
