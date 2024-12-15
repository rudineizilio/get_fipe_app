import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/state/fipe_provider.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/widgets/list_vehicles.dart';
import 'package:trabalho_pos_flutter/src/features/login/pages/login_page.dart';
import 'package:trabalho_pos_flutter/src/features/login/state/login_provider.dart';
import 'package:trabalho_pos_flutter/src/features/widgets/error_message.dart';

class FipeVehiclesPage extends StatefulWidget {
  const FipeVehiclesPage({super.key});

  @override
  State<FipeVehiclesPage> createState() => _FipeVehiclesPageState();
}

class _FipeVehiclesPageState extends State<FipeVehiclesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Modelos de veículos'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              context.read<LoginProvider>().logout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: context.read<FipeProvider>().getVehicles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: ErrorMessage(
                text: 'Nenhum Modelo FIAT Encontrado :(',
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {          
            return ListVehicles(vehicles: snapshot.data!);
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}