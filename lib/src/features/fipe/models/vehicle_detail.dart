class VehicleDetail {
  int? tipoVeiculo;
  String? valor;
  String? marca;
  String? modelo;
  int? anoModelo;
  String? combustivel;
  String? codigoFipe;
  String? mesReferencia;
  String? siglaCombustivel;

  VehicleDetail({
    this.tipoVeiculo,
    this.valor,
    this.marca,
    this.modelo,
    this.anoModelo,
    this.combustivel,
    this.codigoFipe,
    this.mesReferencia,
    this.siglaCombustivel,
  });

  VehicleDetail.fromJson(Map<String, dynamic> json) {
    tipoVeiculo = json['TipoVeiculo'];
    valor = json['Valor'];
    marca = json['Marca'];
    modelo = json['Modelo'];
    anoModelo = json['AnoModelo'];
    combustivel = json['Combustivel'];
    codigoFipe = json['CodigoFipe'];
    mesReferencia = json['MesReferencia'];
    siglaCombustivel = json['SiglaCombustivel'];
  }
}