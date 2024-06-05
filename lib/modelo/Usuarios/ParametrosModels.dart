// ignore_for_file: file_names
class Parametros {
  List<Parametro> dato = [];
  Parametros();

  Parametros.fromlist(List<dynamic> datos) {
    if (datos.isEmpty) return;

    for (var item in datos) {
      final detalle = Parametro.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}
// $result['rp']='si';
// $result['id']=$registro['id'];
// $result['parametro']=$registro['parametro'];
// $result['idtipoParametro ']=$registro['idtipoParametro '];

class Parametro {
  String? rp;
  String? id;
  String? parametro;
  String? idtipoParametro;

  Parametro({
    this.rp,
    this.id,
    this.parametro,
    this.idtipoParametro,
  });

  Parametro.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'].toString();
    id = datos['id'].toString();
    parametro = datos['parametro'].toString();
    idtipoParametro = datos['idtipoParametro'].toString();
  }
}
