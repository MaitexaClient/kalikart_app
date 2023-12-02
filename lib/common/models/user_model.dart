class User {
  String? sId;
  String? loginId;
  String? name;
  String? phone;
  String? email;
  String? password;

  User(
      {this.sId,
      this.loginId,
      this.name,
      this.phone,
      this.email,
      this.password});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    loginId = json['login_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    data['login_id'] = loginId;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}