class RegisterData {
  String id;
  String firstname;
  String lastname;
  String gender;
  String birthdate;

  RegisterData({
    this.id,
    this.firstname,
    this.lastname,
    this.gender,
    this.birthdate,
  });

  RegisterData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    gender = json['gender'];
    birthdate = json['birthdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['gender'] = this.gender;
    data['birthdate'] = this.birthdate;
    return data;
  }
}
