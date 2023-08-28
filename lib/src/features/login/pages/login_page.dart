import 'package:flutter/material.dart';
import 'package:get_fipe_app/src/features/fipe/pages/fipe_vehicles_page.dart';
import 'package:get_fipe_app/src/features/login/models/user_model.dart';
import 'package:get_fipe_app/src/features/login/state/login_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final User _user = User();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                maxLength: 11,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CPF',
                ),
                onChanged: (value) {
                  _user.cpf = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe um CPF';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
                onChanged: (value) {
                  _user.password = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe uma senha';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextButton(
                child: const Text('Acessar'),              
                onPressed: () {
                  //Validação do Form para verificar campos vazios e exibição do Snack caso o usuário não corresponde
                  //com os usuários da base (lista no provider).
                  if (_formKey.currentState!.validate()) {
                    if (context.read<LoginProvider>().isValidUser(_user)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FipeVehiclesPage()),
                      );
                      return;
                    }
          
                    final scaffold = ScaffoldMessenger.of(context);
                    scaffold.showSnackBar(
                      const SnackBar(
                        content: Text('Dados incorretos'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}