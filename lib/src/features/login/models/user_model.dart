class User {
  String? cpf;
  String? password;

  User({
    this.cpf,
    this.password,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      cpf: map['cpf'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'password': password,
    };
  }
}