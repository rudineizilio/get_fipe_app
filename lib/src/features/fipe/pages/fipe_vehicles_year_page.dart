import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/state/fipe_provider.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/widgets/list_vehicles_years.dart';
import 'package:trabalho_pos_flutter/src/features/widgets/error_message.dart';

class FipeVehiclesYearsPage extends StatelessWidget {
  final int codeVehicle;
  final String nameVehicle;

  const FipeVehiclesYearsPage({
    super.key,
    required this.codeVehicle,
    required this.nameVehicle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anos do $nameVehicle'),
      ),      
      body: FutureBuilder(
        future: context.read<FipeProvider>().getVehicleYears(code: codeVehicle),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: ErrorMessage(
                text: 'Nenhum Ano para esse modelo foi encontrado :(',
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {          
            return ListVehicleYears(
              years: snapshot.data!,
              codeVehicle: codeVehicle,
              nameVehicle: nameVehicle,
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}