import 'package:mybudiluhur/features/forum/domain/entities/forum_app.dart';

abstract class ForumAppRepository {
  Future<List<ForumApp>?> fetchForum();
  Future<List<ForumApp>?> refreshData(String nis);
}
