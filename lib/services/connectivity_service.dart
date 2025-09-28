import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {

  // コンストラクタを使用してConnectivityクラスをインスタンス化
  final Connectivity _connectivity = Connectivity();

  /// 現在のネットワーク接続状態を取得するメソッド
  Future<List<ConnectivityResult>> getCurrentConnectivity() async {
    try {
      return await _connectivity.checkConnectivity();
    } catch(e) {
      throw Exception('Failed to check connectivity: $e');
    }
  }
}
