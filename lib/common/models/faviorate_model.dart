class FavouriteModel {
  String? sId;
  String? loginId;
  String? productName;
  String? subCategory;
  int? offer;
  int? price;
  String ? image;

  FavouriteModel(
      {this.sId,
      this.loginId,
      this.productName,
      this.subCategory,
      this.offer,
      this.price,
      this.image});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    loginId = json['login_id'];
    productName = json['product_name'];
    subCategory = json['sub_category'];
    offer = json['offer'];
    price = json['price'];
    image = json['image'][0];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['login_id'] = loginId;
    data['product_name'] = productName;
    data['sub_category'] = subCategory;
    data['offer'] = offer;
    data['price'] = price;
    data['image'] = image;
    return data;
  }
}