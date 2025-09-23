import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/post.dart';

class DatabaseService {
  static Isar? _isar;

  // 初期化
  static Future<Isar> initialize() async {
    if (_isar != null) return _isar!;

    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [PostSchema],
      directory: dir.path,
    );

    return _isar!;
  }

  // インスタンス取得
  static Isar get instance {
    if (_isar == null) {
      throw Exception("Database not initialized");
    }
    return _isar!;
  }
}
