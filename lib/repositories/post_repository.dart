import 'package:isar/isar.dart';
import '../models/post.dart';
import '../services/database_service.dart';

class PostRepository {
  final Isar _isar = DatabaseService.instance;

  /// 新しい投稿を作成する
  /// [post] 作成する投稿データ
  /// 戻り値: 作成された投稿（IDが設定済み）
  Future<Post> create(Post post) async {
    // 作成時の自動設定
    post.createdAt = DateTime.now();
    post.isSynced = false; // 新規作成時は未同期状態

    await _isar.writeTxn(() async {
      await _isar.posts.put(post);
    });

    return post;
  }

  /// IDを指定して投稿を取得する
  /// [id] 取得する投稿のID
  /// 戻り値: 投稿オブジェクト、存在しない場合はnull
  Future<Post?> getById(Id id) async {
    return await _isar.posts.get(id);
  }

  /// 全ての投稿を取得する
  /// 戻り値: 投稿リスト（作成日時の降順）
  Future<List<Post>> getAll() async {
    return await _isar.posts
        .where()
        .sortByCreatedAtDesc()
        .findAll();
  }

  /// 投稿を更新する
  /// [post] 更新する投稿データ（IDが必須）
  /// 戻り値: 更新された投稿
  Future<Post> update(Post post) async {
    // 更新時の自動設定
    post.isSynced = false; // 更新時は未同期状態にリセット

    await _isar.writeTxn(() async {
      await _isar.posts.put(post);
    });

    return post;
  }

  /// 投稿を削除する
  /// [id] 削除する投稿のID
  /// 戻り値: 削除成功時true、存在しない場合false
  Future<bool> delete(Id id) async {
    return await _isar.writeTxn(() async {
      return await _isar.posts.delete(id);
    });
  }

  /// 同期待ちの投稿一覧を取得する
  /// 戻り値: 未同期の投稿リスト（作成日時順）
  Future<List<Post>> getSyncPending() async {
    return await _isar.posts
        .where()
        .isSyncedEqualTo(false)
        .sortByCreatedAt()
        .findAll();
  }
}