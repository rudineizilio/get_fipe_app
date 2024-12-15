import 'package:flutter/material.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/models/vehicles.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/pages/fipe_vehicles_details_page.dart';

class ListVehicleYears extends StatelessWidget {
  final List<Anos> years;
  final int codeVehicle;
  final String nameVehicle;

  const ListVehicleYears({
    super.key,
    required this.years,
    required this.codeVehicle,
    required this.nameVehicle,
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
        itemCount: years.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(years[index].nome!),
            onTap: () {
              Navigator.of(context).push(
                _createRouteAnimation(
                  years[index].codigo!,
                )
              );
            },
          );
        }
      ),
    );
  }

  //Animaçao da rota de navegação para página de detalhes do veículo.
  Route _createRouteAnimation(String yearVehicle) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FipeVehiclesDetailsPage(
        codeVehicle: codeVehicle,
        nameVehicle: nameVehicle,
        yearVehicle: yearVehicle,
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