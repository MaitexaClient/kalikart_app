
class Category {
  String? sId;
  String? category;
  String ? image;

  Category({this.sId, this.category});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    category = json['category'];
    image = json['image'][0];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    data['category'] = category;

    return data;
  }
}