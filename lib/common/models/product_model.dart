class Product {
  String? sId;
  String? shopId;
  String? categoryId;
  String? productName;
  String? subCategory;
  int? price;
  String? availableQuantity;
  int? offer;
  List<String>? image;
  String? description;
  int? iV;

  Product(
      {this.sId,
      this.shopId,
      this.categoryId,
      this.productName,
      this.subCategory,
      this.price,
      this.availableQuantity,
      this.offer,
      this.image,
      this.description,
      this.iV});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    shopId = json['shop_id'];
    categoryId = json['category_id'];
    productName = json['product_name'];
    subCategory = json['sub_category'];
    price = json['price'];
    availableQuantity = json['available_quantity'];
    offer = json['offer'];
    image = json['image'].cast<String>();
    description = json['description'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['_id'] = sId;
    data['shop_id'] = shopId;
    data['category_id'] = categoryId;
    data['product_name'] = productName;
    data['sub_category'] = subCategory;
    data['price'] = price;
    data['available_quantity'] = availableQuantity;
    data['offer'] = offer;
    data['image'] = image;
    data['description'] = description;
    data['__v'] = iV;
    return data;
  }
}

