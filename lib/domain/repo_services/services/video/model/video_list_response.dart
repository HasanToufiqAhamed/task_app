class VideoListResponse {
  bool? success;
  List<Data>? data;

  VideoListResponse({this.success, this.data});

  VideoListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? caption;
  String? videoUrl;
  DateTime? createdAt;

  Data({this.id, this.caption, this.videoUrl, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    caption = json['caption'];
    videoUrl = json['video_url'];
    createdAt = DateTime.parse(json['created_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['caption'] = caption;
    data['video_url'] = videoUrl;
    data['created_at'] = createdAt;
    return data;
  }
}
