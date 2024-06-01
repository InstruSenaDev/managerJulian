// ignore_for_file: file_names
class Centros {
  List<Centro> dato = [];
  Centros();

  Centros.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = Centro.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}
// $result['rp']='si';
// $result['id']=$registro['id'];
// $result['centro']=$registro['centro'];
// $result['telefono']=$registro['telefono'];//descripcion
// $result['ubicacion']=$registro['ubicacion'];//descripcion
// $result['idTipo']=$registro['idTipo'];//descripcion
// $result['tipo']=$registro['tipo'];
// $result['idCiudad']=$registro['idCiudad'];
// $result['ciudad']=$registro['ciudad'];
// $result['idEstado']=$registro['idEstado'];
// $result['estado']=$registro['estado'];
// $result['colorEstado']=$registro['colorEstado'];
// $json['rpta'][]=$result;

class Centro {
  String? rp;
  String? id;
  String? centro;
  String? telefono;
  String? ubicacion;
  String? idTipo;
  String? tipo;
  String? idCiudad;
  String? ciudad;
  String? idEstado;
  String? estado;
  String? colorEstado;

  Centro({
    this.rp,
    this.id,
    this.centro,
    this.telefono,
    this.ubicacion,
    this.idTipo,
    this.tipo,
    this.idCiudad,
    this.ciudad,
    this.idEstado,
    this.estado,
    this.colorEstado,
  });

  Centro.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'].toString();
    id = datos['id'].toString();
    centro = datos['centro'].toString();
    telefono = datos['telefono'].toString();
    ubicacion = datos['ubicacion'].toString();
    idTipo = datos['idTipo'].toString();
    tipo = datos['tipo'].toString();
    idCiudad = datos['idCiudad'].toString();
    ciudad = datos['ciudad'].toString();
    idEstado = datos['idEstado'].toString();
    estado = datos['estado'].toString();
    colorEstado = datos['colorEstado'].toString();
  }
}
