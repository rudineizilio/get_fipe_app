import 'package:flutter/material.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/models/vehicle_detail.dart';

class VehicleDetails extends StatefulWidget {
  final VehicleDetail vehicleDetail;

  const VehicleDetails({
    super.key,
    required this.vehicleDetail,
  });

  @override
  State<VehicleDetails> createState() => _VehicleDetailsState();
}

class _VehicleDetailsState extends State<VehicleDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          ListTile(
            title: const Text('Marca'),
            subtitle: Text(widget.vehicleDetail.marca!),
          ),
          ListTile(
            title: const Text('Modelo'),
            subtitle: Text(widget.vehicleDetail.modelo!),
          ),
          ListTile(
            title: const Text('Ano'),
            subtitle: Text(widget.vehicleDetail.anoModelo!.toString()),
          ),
          ListTile(
            title: const Text('Combustível'),
            subtitle: Text(widget.vehicleDetail.combustivel!),
          ),
          ListTile(
            title: const Text('Valor'),
            subtitle: Text(widget.vehicleDetail.valor!),
          ),
        ],
      ),
    );
  }
}