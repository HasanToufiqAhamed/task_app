import 'dart:convert';

class VideoListUIModel {
  int id;
  String caption;
  String videoUrl;
  DateTime createdAt;

  VideoListUIModel({
    required this.id,
    required this.caption,
    required this.videoUrl,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['caption'] = caption;
    data['video_url'] = videoUrl;
    data['created_at'] = createdAt;
    return data;
  }

  @override
  String toString() => const JsonEncoder.withIndent(' ').convert(toJson());
}
