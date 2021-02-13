class Auth {
  String id;
  String email;
  String password;

  Auth({
    this.id,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
