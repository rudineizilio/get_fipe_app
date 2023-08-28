import 'package:flutter/material.dart';
import 'package:get_fipe_app/src/features/fipe/models/vehicle_detail.dart';

class VehicleDetails extends StatelessWidget {
  final VehicleDetail vehicleDetail;

  const VehicleDetails({
    required this.vehicleDetail,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          ListTile(
            title: const Text('Marca'),
            subtitle: Text(vehicleDetail.marca!),
          ),
          ListTile(
            title: const Text('Modelo'),
            subtitle: Text(vehicleDetail.modelo!),
          ),
          ListTile(
            title: const Text('Ano'),
            subtitle: Text(vehicleDetail.anoModelo!.toString()),
          ),
          ListTile(
            title: const Text('Combustível'),
            subtitle: Text(vehicleDetail.combustivel!),
          ),
          ListTile(
            title: const Text('Valor'),
            subtitle: Text(vehicleDetail.valor!),
          ),
        ],
      ),
    );
  }
}