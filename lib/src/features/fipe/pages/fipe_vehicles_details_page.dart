import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/state/fipe_provider.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/widgets/vehicle_details.dart';
import 'package:trabalho_pos_flutter/src/features/widgets/error_message.dart';

class FipeVehiclesDetailsPage extends StatelessWidget {
  final String yearVehicle;
  final int codeVehicle;
  final String nameVehicle;

  const FipeVehiclesDetailsPage({
    super.key,
    required this.yearVehicle,
    required this.codeVehicle,
    required this.nameVehicle,
  });

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