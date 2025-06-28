import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ForumApp {
  final String id;
  final String authorName;
  final String authorImageUrl;
  final String tagsForum;
  final String titleForum;
  final String bodyForum;
  final String timePostForum;
  final String likesForum;
  final String commentsForum;

  ForumApp({
    required this.id,
    required this.authorName,
    required this.authorImageUrl,
    required this.tagsForum,
    required this.titleForum,
    required this.bodyForum,
    required this.timePostForum,
    required this.likesForum,
    required this.commentsForum,
  });

  ForumApp copyWith({
    String? newTagsForum,
    String? newTitleForum,
    String? newBodyForum,
    String? newLikesForum,
    String? newCommentsForum,
  }) {
    return ForumApp(
      id: id,
      authorName: authorName,
      authorImageUrl: authorImageUrl,
      tagsForum: newTagsForum ?? '',
      titleForum: newTitleForum ?? '',
      bodyForum: newBodyForum ?? '',
      timePostForum: timePostForum,
      likesForum: newLikesForum ?? '',
      commentsForum: newCommentsForum ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'authorName': authorName,
      'authorImageUrl': authorImageUrl,
      'tagsForum': tagsForum,
      'titleForum': titleForum,
      'bodyForum': bodyForum,
      'timePostForum': timePostForum,
      'likesForum': likesForum,
      'commentsForum': commentsForum,
    };
  }

  factory ForumApp.fromMap(Map<String, dynamic> map) {
    return ForumApp(
      id: map['id'].toString(),
      authorName: map['authorName'] ?? '',
      authorImageUrl: map['authorImageUrl'] ?? '',
      tagsForum: map['tagsForum'] ?? '',
      titleForum: map['titleForum'] as String,
      bodyForum: map['bodyForum'] as String,
      timePostForum: map['timePostForum'].toString(),
      likesForum: map['likesForum'].toString(),
      commentsForum: map['commentsForum'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ForumApp.fromJson(String source) =>
      ForumApp.fromMap(json.decode(source) as Map<String, dynamic>);
}
