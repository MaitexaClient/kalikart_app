class User {
  String? sId;
  String? loginId;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? image;

  User(
      {this.sId,
      this.loginId,
      this.name,
      this.phone,
      this.email,
      this.password,
      this.image
      });

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    loginId = json['login_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    if(json['image']!= null){
      
      image = json['image'][0];
    }
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