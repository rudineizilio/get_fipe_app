import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_pos_flutter/src/features/fipe/pages/fipe_vehicles_page.dart';
import 'package:trabalho_pos_flutter/src/features/login/models/user_model.dart';
import 'package:trabalho_pos_flutter/src/features/login/state/login_provider.dart';

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
              Center(
                child: Image.asset(
                  'assets/login_page.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 32),
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
              const SizedBox(height: 32),
              Consumer<LoginProvider>(
                builder: (context, loginProvider, child) {
                  return ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        bool isValid = await loginProvider.login(_user);
                        if (isValid) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const FipeVehiclesPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Dados de login inválidos')),
                          );
                        }
                      }
                    },
                    child: Text(
                      'Acessar',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await context.read<LoginProvider>().registerUser(_user);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Usuário registrado com sucesso')),
                    );
                  }
                },
                child: Text(
                  'Cadastrar novo usuário',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}