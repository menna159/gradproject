class DocsigninAccountModel {
  final dynamic? email;
  final dynamic? password;
  final dynamic? token;

  DocsigninAccountModel({
    required this.email,
    required this.password,
    this.token,
  });

  factory DocsigninAccountModel.fromjson(jsonData) {
    return DocsigninAccountModel(
        email: jsonData['email'],
        password: jsonData['password'],
        token: jsonData['token']);
  }
}
