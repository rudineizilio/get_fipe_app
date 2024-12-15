import 'package:dio/dio.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/models/vehicle_detail.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/models/vehicles.dart';
import 'package:trabalho_pos_flutter/src/rest/rest_client.dart';

class FipeProvider {
  final _restClient = RestClient(Dio());

  //Método que comunica com a page para fazer a chamada REST e retornar os veículos
  Future<Vehicles> getVehicles() async {
    return await _restClient.getVehicles();
  }

  //Método que comunica com a page para fazer a chamada REST e retornar os anos do veículo
  Future<List<Anos>> getVehicleYears({required int code}) async {
    return await _restClient.getVehicleYears(code);
  }

  //Método que comunica com a page para fazer a chamada REST e retornar os detalhes do veículo
  Future<VehicleDetail> getVehicleDetails({required int code, required String year}) async {
    return await _restClient.getVehicleDetails(code, year);
  }
}