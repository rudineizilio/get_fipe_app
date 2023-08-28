import 'package:get_fipe_app/src/features/login/models/user_model.dart';

class LoginProvider {
  //Usuários criados para testar o Login
  List<User> users = [
    User(
      cpf: '10653746903',
      password: '1234'
    ),
    User(
      cpf: '20682164003',
      password: '1234'
    ),
  ];

  //Método para validação do login, onde irá verificar se os dados digitados na tela de login
  //correspondem com um dos usuários da lista.
  bool isValidUser(User user) {
    return users.any((element) => element.cpf == user.cpf && element.password == user.password);
  }
}