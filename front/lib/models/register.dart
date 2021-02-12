class Register {
  String email;
  String firstname;
  String lastname;
  String password;
  String birthdate;

  Register({
    this.email,
    this.firstname,
    this.lastname,
    this.password,
    this.birthdate,
  });

  Register.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    password = json['password'];
    birthdate = json['birthdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['password'] = this.password;
    data['birthdate'] = this.birthdate;
    return data;
  }
}
