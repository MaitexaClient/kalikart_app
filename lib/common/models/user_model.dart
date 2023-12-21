class User {
  String? sId;
  String? loginId;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? image;
  int? creditPoint;
  int? creditPrice;

  User(
      {this.sId,
      this.loginId,
      this.name,
      this.phone,
      this.email,
      this.password,
      this.image,
      this.creditPoint,
      this.creditPrice
      });

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    loginId = json['login_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    if (json['image'] != null) {
      image = json['image'][0];
    }
    creditPoint = json['credit_points'];
    creditPrice = json['credit_points_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['login_id'] = loginId;
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
