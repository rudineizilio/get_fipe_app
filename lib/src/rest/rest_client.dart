import 'package:get_fipe_app/src/features/fipe/models/vehicle_detail.dart';
import 'package:get_fipe_app/src/features/fipe/models/vehicles.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://parallelum.com.br/fipe/api/v1/carros/marcas/21')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  //Foi adicionado o código 21 (Fiat) para facilitar e não precisar criar mais uma tela onde exibiriam as marcas.
  //Sendo assim, sempre irá vir apenas os modelos da Fiat.

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