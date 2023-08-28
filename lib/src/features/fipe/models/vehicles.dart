class Vehicles {
  List<Modelos>? modelos;
  List<Anos>? anos;

  Vehicles({this.modelos, this.anos});

  Vehicles.fromJson(Map<String, dynamic> json) {
    if (json['modelos'] != null) {
      modelos = <Modelos>[];
      json['modelos'].forEach((v) {
        modelos!.add(Modelos.fromJson(v));
      });
    }
    if (json['anos'] != null) {
      anos = <Anos>[];
      json['anos'].forEach((v) {
        anos!.add(Anos.fromJson(v));
      });
    }
  }
}

class Modelos {
  int? codigo;
  String? nome;

  Modelos({this.codigo, this.nome});

  Modelos.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    nome = json['nome'];
  }
}

class Anos {
  String? codigo;
  String? nome;

  Anos({this.codigo, this.nome});

  Anos.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    nome = json['nome'];
  }
}
