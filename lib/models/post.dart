import 'package:isar/isar.dart';

part 'post.g.dart';

@collection
class Post {
  Id id = Isar.autoIncrement;

  // 投稿内容
  late String title;
  late String body;
  late int userId;

  // 同期状態管理
  @Index()
  late bool isSynced;

  // 作成日時（インデックス付きで並び替え効率化）
  @Index()
  late DateTime createdAt;

  // 同期日時（同期前はnull）
  DateTime? syncedAt;
}