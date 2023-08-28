import 'package:flutter/material.dart';
import 'package:get_fipe_app/src/features/fipe/state/fipe_provider.dart';
import 'package:get_fipe_app/src/features/fipe/widgets/list_vehicles_years.dart';
import 'package:get_fipe_app/src/features/widgets/error_message.dart';
import 'package:provider/provider.dart';

class FipeVehiclesYearsPage extends StatelessWidget {
  final int codeVehicle;
  final String nameVehicle;

  const FipeVehiclesYearsPage({
    required this.codeVehicle,
    required this.nameVehicle,
    Key? key,
  }) : super(key: key);

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