import 'package:flutter/material.dart';
import 'package:get_fipe_app/src/features/fipe/state/fipe_provider.dart';
import 'package:get_fipe_app/src/features/fipe/widgets/vehicle_details.dart';
import 'package:get_fipe_app/src/features/widgets/error_message.dart';
import 'package:provider/provider.dart';

class FipeVehiclesDetailsPage extends StatelessWidget {
  final String yearVehicle;
  final int codeVehicle;
  final String nameVehicle;

  const FipeVehiclesDetailsPage({
    required this.yearVehicle,
    required this.codeVehicle,
    required this.nameVehicle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameVehicle),
      ),
      body: FutureBuilder(
        future: context.read<FipeProvider>().getVehicleDetails(code: codeVehicle, year: yearVehicle),
        builder:(context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: ErrorMessage(
                text: 'Nenhum dado encontrado para esse veículo :(',
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {          
            return VehicleDetails(
              vehicleDetail: snapshot.data!,
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}