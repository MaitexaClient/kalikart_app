class AddressModel {
  String? sId;
  String? loginId;
  int? addressCount;
  String? name;
  String? phone;
  String? address;
  String? pincode;
  String? state;
  String? city;
  String? landmark;
  String? addressType;

  AddressModel(
      {this.sId,
      this.loginId,
      this.addressCount,
      this.name,
      this.phone,
      this.address,
      this.pincode,
      this.state,
      this.city,
      this.landmark,
      this.addressType});

  AddressModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    loginId = json['login_id'];
    addressCount = json['addressCount'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    pincode = json['pincode'];
    state = json['state'];
    city = json['city'];
    landmark = json['landmark'];
    addressType = json['addressType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['login_id'] = loginId;
    data['addressCount'] = addressCount;
    data['name'] = name;
    data['phone'] = phone;
    data['address'] = address;
    data['pincode'] = pincode;
    data['state'] = state;
    data['city'] = city;
    data['landmark'] = landmark;
    data['addressType'] = addressType;
    return data;
  }
}