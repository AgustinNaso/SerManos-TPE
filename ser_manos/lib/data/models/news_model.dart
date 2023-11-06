import 'json_serializable.dart';


// TODO: analize if body belongs here on a details model
class News extends JsonSerializable<News> {
  final String id;
  final String source;
  final String title;
  final String subtitle;
  final String imgUrl;
  final String body;

  News({
    required this.id,
    required this.source,
    required this.title,
    required this.subtitle,
    required this.imgUrl,
    required this.body,
  });

  @override
  static News fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      source: json['source'],
      title: json['title'],
      subtitle: json['subtitle'],
      imgUrl: json['imgUrl'],
      body: json['body'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'source': source,
      'title': title,
      'subtitle': subtitle,
      'imgUrl': imgUrl,
      'body': body,
    };
  }

  // body is shorted to 20 characters for the sake of brevity
  @override
  String toString() {
    return 'News{id: $id, source: $source, title: $title, subtitle: $subtitle, imgUrl: $imgUrl, body: ${body.substring(0, 20)}}';
  }
}
