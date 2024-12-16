import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/models/vehicle_detail.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/models/vehicles.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://parallelum.com.br/fipe/api/v1/carros/marcas')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  //Requisição para carregar os modelos de veículos
  @GET('/modelos')
  Future<Vehicles> getVehicles();

  //Requisição REST para carregar os anos do veículo
  @GET('/modelos/{codigo}/anos')
  Future<List<Anos>> getVehicleYears(@Path('codigo') int code);

  //Requisição REST para carregar os detalhes do veículo
  @GET('/modelos/{codigo}/anos/{ano}')
  Future<VehicleDetail> getVehicleDetails(@Path('codigo') int code, @Path('ano') String year);
}