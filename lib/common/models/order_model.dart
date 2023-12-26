class OrderModel {
  String? sId;
  String? loginId;
  String? addressId;
  String? productName;
  int? quantity;
  int? subtotal;
  int? offer;
  String? description;
  int? price;
  String? orderStatus;
  List<String>? image;
  String? name;
  String? phone;
  int? addressCount;
  String? address;
  String? pincode;
  String? city;
  String? state;
  String? landmark;
  String? addressType;

  OrderModel(
      {this.sId,
      this.loginId,
      this.addressId,
      this.productName,
      this.quantity,
      this.subtotal,
      this.offer,
      this.description,
      this.price,
      this.orderStatus,
      this.image,
      this.name,
      this.phone,
      this.addressCount,
      this.address,
      this.pincode,
      this.city,
      this.state,
      this.landmark,
      this.addressType});

  OrderModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    loginId = json['login_id'];
    addressId = json['address_id'];
    productName = json['product_name'];
    quantity = json['quantity'];
    subtotal = json['subtotal'];
    offer = json['offer'];
    description = json['description'];
    price = json['price'];
    orderStatus = json['order_status'];
    image = json['image'].cast<String>();
    name = json['name'];
    phone = json['phone'];
    addressCount = json['addressCount'];
    address = json['address'];
    pincode = json['pincode'];
    city = json['city'];
    state = json['state'];
    landmark = json['landmark'];
    addressType = json['addressType'];
  }

 
}
