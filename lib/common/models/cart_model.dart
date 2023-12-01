class CartModel {
  dynamic  nId;
  int? total;
  List<CartProducts>? cartProducts;

  CartModel({this.nId, this.total, this.cartProducts});

  CartModel.fromJson(Map<String, dynamic> json) {
    nId = json['_id'];
    total = json['total'];
    if (json['cartProducts'] != null) {
      cartProducts = <CartProducts>[];
      json['cartProducts'].forEach((v) {
        cartProducts!.add(CartProducts.fromJson(v));
      });
    }
  }

  
}

class CartProducts {
  String? sId;
  String? loginId;
  String? productName;
  String? subCategory;
  String ? image;
  int? offer;
  int? price;
  int? quantity;
  int? subtotal;

  CartProducts(
      {this.sId,
      this.loginId,
      this.productName,
      this.subCategory,
      this.offer,
      this.price,
      this.quantity,
      this.subtotal,
      this.image
      });

  CartProducts.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    loginId = json['login_id'];
    productName = json['product_name'];
    subCategory = json['sub_category'];
    offer = json['offer'];
    price = json['price'];
    quantity = json['quantity'];
    subtotal = json['subtotal'];
    image = json['image'][0];
  }

  
}