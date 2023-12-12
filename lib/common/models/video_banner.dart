class VideoBanner {
  String? sId;
  String? title;
  String? video;
  String? thumbNail;
  int? iV;

  VideoBanner({this.sId, this.title, this.video, this.iV});

  VideoBanner.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    video = json['video'][0];
    iV = json['__v'];
    thumbNail = json['thumbnail'];
  }

 
}
