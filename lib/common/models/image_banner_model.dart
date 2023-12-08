class ImageBanner {
  String? sId;
  String? title;
  String? image;

  ImageBanner({this.sId, this.title, this.image});

  ImageBanner.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    image = json['image'][0];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}
