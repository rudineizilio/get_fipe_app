import 'package:flutter/material.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/models/vehicles.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/pages/fipe_vehicles_year_page.dart';

class ListVehicles extends StatelessWidget {
  final Vehicles vehicles;

  const ListVehicles({
    super.key,
    required this.vehicles,  
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 0,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: ListView.builder(
        itemCount: vehicles.modelos!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(vehicles.modelos![index].nome!),
            onTap: () {
              Navigator.of(context).push(
                _createRouteAnimation(
                  vehicles.modelos![index].codigo!,
                  vehicles.modelos![index].nome!,
                )
              );
            },
          );
        }
      ),
    );
  }

  //Animaçao da rota de navegação para página de detalhes dos anos do veículo.
  Route _createRouteAnimation(int codeVehicle, String nameVehicle) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FipeVehiclesYearsPage(
        codeVehicle: codeVehicle,
        nameVehicle: nameVehicle,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}