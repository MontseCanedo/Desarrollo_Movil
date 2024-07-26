import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String urlVideo;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.urlVideo,
    this.likes = 0,
    this.views = 0,
  });

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
        name: json["name"] ?? '',
        urlVideo: json["videoUrl"],
        likes: json["likes"] ?? 0,
        views: json["views"] ?? 0,
      );

  VideoPost toVideoPostEntity() => VideoPost(
        caption: name,
        videoUrl: urlVideo,
        likes: likes,
        views: views,
      );
}
