// ignore_for_file: file_names
class Procedimientos {
  List<Procedimiento> dato = [];
  Procedimientos();

  Procedimientos.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = Procedimiento.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}
// $isDate=true;
// $result['rp']='si';
// $result['id']=$registro['id'];
// $result['procedimiento']=$registro['procedimiento'];
// $result['descripcion']=$registro['descripcion'];//descripcion
// $result['idCuerpo ']=$registro['idCuerpo '];//descripcion
// $result['cuerpo']=$registro['cuerpo'];
// $result['idEstado']=$registro['idEstado'];
// $result['estado']=$registro['estado'];
// $result['colorEstado']=$registro['colorEstado'];
// $result['tipo']=$registro['tipo'];

class Procedimiento {
  String? rp;
  String? id;
  String? procedimiento;
  String? descripcion;
  String? idCuerpo;
  String? cuerpo;
  String? idEstado;
  String? estado;
  String? colorEstado;
  String? tipo;

  Procedimiento({
    this.rp,
    this.id,
    this.procedimiento,
    this.descripcion,
    this.idCuerpo,
    this.cuerpo,
    this.idEstado,
    this.estado,
    this.colorEstado,
    this.tipo,
  });

  Procedimiento.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'].toString();
    id = datos['id'].toString();
    procedimiento = datos['procedimiento'].toString();
    descripcion = datos['descripcion'].toString();
    idCuerpo = datos['idCuerpo'].toString();
    cuerpo = datos['cuerpo'].toString();
    idEstado = datos['idEstado'].toString();
    estado = datos['estado'].toString();
    colorEstado = datos['colorEstado'].toString();
    tipo = datos['tipo'].toString();
  }
}
