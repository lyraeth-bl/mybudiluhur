import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mybudiluhur/core/api/api_url.dart';
import 'package:mybudiluhur/core/storage/flutter_secure_storage.dart';
import 'package:mybudiluhur/features/forum/domain/entities/forum_app.dart';
import 'package:mybudiluhur/features/forum/domain/repository/forum_app_repository.dart';

class ApiForumAppRepository implements ForumAppRepository {
  final _apiForumUrl = ApiUrl.forumBaseUrl;

  @override
  Future<List<ForumApp>?> fetchForum() async {
    final forumUser = await secureStorage.read(key: "forum");

    if (forumUser == null) {
      return null;
    }

    final forum = jsonDecode(forumUser);

    return (forum as List)
        .map(
          (item) => ForumApp(
            id: item['id'].toString(),
            authorName: item['authorName'],
            authorImageUrl: item['authorImageUrl'],
            tagsForum: item['tagsForum'],
            titleForum: item['titleForum'],
            bodyForum: item['bodyForum'],
            timePostForum: item['timePostForum'].toString(),
            likesForum: item['likesForum'].toString(),
            commentsForum: item['commentsForum'].toString(),
          ),
        )
        .toList();
  }

  @override
  Future<List<ForumApp>?> refreshData(String nis) async {
    final token = await secureStorage.read(key: "token");

    await secureStorage.delete(key: "forum");

    try {
      final response = await http.get(
        Uri.parse('$_apiForumUrl/$nis'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        await secureStorage.write(key: "forum", value: jsonEncode(data));
      }
      return null;
    } catch (e) {
      throw Exception("Failed to refresh data forum : $e");
    }
  }
}
