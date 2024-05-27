// ignore_for_file: file_names
class Recomendaciones {
  List<Recomendacion> dato = [];
  Recomendaciones();

  Recomendaciones.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = Recomendacion.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}
// $isDate=true;
// $result['rp']='si';
// $result['id']=$registro['id'];
// $result['recomendacion']=$registro['recomendacion'];
// $result['idtipoRecomendacion']=$registro['idtipoRecomendacion'];//descripcion
// $result['tipo']=$registro['tipo'];//descripcion
// $result['colorTipo']=$registro['colorTipo'];//descripcion
// $result['idProcedimientos']=$registro['idProcedimientos'];
// $result['procedimiento']=$registro['procedimiento'];
// $result['idEstado']=$registro['idEstado'];
// $result['estado']=$registro['estado'];
// $json['rpta'][]=$result;
// $result['colorEstado']=$registro['colorEstado'];

class Recomendacion {
  String? rp;
  String? id;
  String? recomendacion;
  String? idtipoRecomendacion;
  String? tipo;
  String? colorTipo;
  String? idProcedimientos;
  String? procedimiento;
  String? idEstado;
  String? estado;
  String? colorEstado;

  Recomendacion({
    this.rp,
    this.id,
    this.recomendacion,
    this.idtipoRecomendacion,
    this.tipo,
    this.colorTipo,
    this.idProcedimientos,
    this.procedimiento,
    this.idEstado,
    this.estado,
    this.colorEstado,
  });

  Recomendacion.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'].toString();
    id = datos['id'].toString();
    recomendacion = datos['recomendacion'].toString();
    idtipoRecomendacion = datos['idtipoRecomendacion'].toString();
    tipo = datos['tipo'].toString();
    colorTipo = datos['colorTipo'].toString();
    idProcedimientos = datos['idProcedimientos'].toString();
    procedimiento = datos['procedimiento'].toString();
    idEstado = datos['idEstado'].toString();
    estado = datos['estado'].toString();
    colorEstado = datos['colorEstado'].toString();
  }
}
