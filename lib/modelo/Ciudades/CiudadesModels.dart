// ignore_for_file: file_names
class Ciudades {
  List<Ciudad> dato = [];
  Ciudades();

  Ciudades.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = Ciudad.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}
// $result['rp']='si';
// $result['id']=$registro['id'];
// $result['ciudad']=$registro['ciudad'];
// $result['idPais']=$registro['idPais'];
// $result['pais']=$registro['pais'];
// $result['idEstado']=$registro['idEstado'];
// $result['estado']=$registro['estado'];
// $result['color']=$registro['color'];

class Ciudad {
  String? rp;
  String? id;
  String? ciudad;
  String? idPais;
  String? pais;
  String? idEstado;
  String? estado;
  String? color;

  Ciudad({
    this.rp,
    this.id,
    this.ciudad,
    this.idPais,
    this.pais,
    this.idEstado,
    this.estado,
    this.color,
  });

  Ciudad.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'].toString();
    id = datos['id'].toString();
    ciudad = datos['ciudad'].toString();
    idPais = datos['idPais'].toString();
    pais = datos['pais'].toString();
    idEstado = datos['idEstado'].toString();
    estado = datos['estado'].toString();
    color = datos['color'].toString();
  }
}
