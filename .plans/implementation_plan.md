# Auto Sync System 実装計画

## プロジェクト概要

`connectivity_plus`のネット接続機能を試すためのFlutterサンプルアプリケーション。
`Isar`で保存したデータを、仮のAPI（`JSONplaceholder`）に定期的に送信することを想定しています。
時間管理には`Timer`を使用し、15分おきに未同期データをチェックして送信するシンプルな実装を目指します。

## 実装目標

- **定期処理**: `Timer`を使用してアプリ使用中に15分間隔で定期的にデータ同期を実行
- **ネットワーク監視**: `connectivity_plus`でネットワーク接続状況を監視し、接続時のみ同期を実行
- **ローカルデータベース**: `isar`を使用してデータのローカル保存と同期状態管理
- **API通信**: JSONplaceholderエンドポイントを使用した仮のデータ送信
- **シンプルな設計**: 公式ドキュメントに基づいたシンプルで理解しやすい実装

## 実装進捗

### 現在の進捗: Phase 4 進行中 (4/9)

- ✅ **Phase 1: 基盤セットアップ** - 完了 (2025/1/24)
- ✅ **Phase 2: データモデル設計** - 完了 (2025/1/24)
- ✅ **Phase 3: データベース層実装** - 完了 (2025/1/24)
- 🔄 **Phase 4: ネットワーク層実装** - 進行中 (ConnectivityService完了、ApiService準備中)
- ⏳ **Phase 5: 同期サービス実装** - 未着手
- ⏳ **Phase 6: Timer処理実装** - 未着手
- ⏳ **Phase 7: UI実装** - 未着手
- ⏳ **Phase 8: Android設定** - 未着手
- ⏳ **Phase 9: テストと最適化** - 未着手

## TODO リスト

### Phase 1: 基盤セットアップ ✅ **完了**

- [x] 必要なパッケージをpubspec.yamlに追加
    - connectivity_plus: 7.0.0 ✅
    - isar: 3.1.0+1 ✅
    - isar_flutter_libs: ^3.1.0+1 ✅
    - path_provider: ^2.1.5 ✅
    - dio: 5.9.0 ✅
- [x] dev_dependenciesにisar_generatorとbuild_runnerを追加
    - isar_generator: ^3.1.0+1 ✅
    - build_runner: ^2.4.13 ✅ (競合回避のためダウングレード)
- [x] プロジェクト構造の整理（models、services、repositories、screens、utils）✅

### Phase 2: データモデル設計 ✅ **完了**

- [x] Isarコレクション用のPostモデル作成 ✅
    - id (auto-increment) ✅
    - title (String) ✅
    - body (String) ✅
    - userId (int) ✅
    - isSynced (bool) - 同期状態の管理 ✅
    - createdAt (DateTime) ✅
    - syncedAt (DateTime?) ✅
- [x] Isarスキーマの生成とコード生成実行 ✅

### Phase 3: データベース層実装 ✅ **完了**

- [x] Isarデータベースの初期化サービス作成 ✅
- [x] PostRepositoryクラス実装 ✅
    - [x] CRUD操作（Create, Read, Update, Delete） ✅
        - create(Post post) - 新規投稿作成（自動ID、同期状態管理） ✅
        - getById(Id id) - ID指定取得（高速検索） ✅
        - getAll() - 全投稿取得（作成日時降順） ✅
        - update(Post post) - 投稿更新（同期状態リセット） ✅
        - delete(Id id) - 投稿削除（成功可否返却） ✅
    - [x] 未同期データの取得メソッド ✅
        - getSyncPending() - 同期待ち一覧（バックグラウンド処理用） ✅
- [ ] データベースのテスト実装

### Phase 4: ネットワーク層実装

- [x] ConnectivityServiceクラス作成 ✅
    - [x] 基本的なネットワーク接続状況取得機能 ✅
    - [x] エラーハンドリング実装 ✅
    - [x] シンプルなYAGNI準拠設計 ✅
- [ ] ApiServiceクラス実装
    - JSONplaceholder APIへのPOST送信（dioを使用）
    - レスポンス処理とエラーハンドリング
    - インターセプターの設定（ログ、タイムアウト等）
- [ ] ネットワーク監視のテスト実装

### Phase 5: 同期サービス実装

- [ ] SyncServiceクラス作成
    - 未同期データの取得
    - ネットワーク接続確認
    - API送信とローカル状態更新
    - エラー時の再試行ロジック
- [ ] 同期処理のテスト実装

### Phase 6: Timer処理実装

- [ ] TimerServiceクラス作成
    - 15分間隔の定期実行Timer設定
    - アプリ使用中のみ動作する制御機能
    - Timer開始/停止メソッド
    - ライフサイクル管理（アプリが非表示になったら停止）
- [ ] メイン画面でのTimer制御統合
- [ ] Timer処理のテスト実装

### Phase 7: UI実装

- [ ] メイン画面の作成
    - 投稿リスト表示
    - 新規投稿作成ボタン
    - 手動同期ボタン
    - ネットワーク状態表示
- [ ] 投稿作成画面
    - タイトル・本文入力フォーム
    - 保存機能
- [ ] 同期状態の可視化
    - 未同期データの表示
    - 同期進行状況の表示

### Phase 8: Android設定

- [ ] AndroidManifest.xmlの設定
    - INTERNET権限の追加
    - Flutter embedding version 2の確認
- [ ] build.gradleの最小SDK確認

### Phase 9: テストと最適化

- [ ] 各コンポーネントの単体テスト
- [ ] 統合テストの実装
- [ ] Timer処理の動作確認
- [ ] パフォーマンスの最適化
- [ ] エラーハンドリングの強化

## ファイル構成計画

```txt
lib/
├── main.dart
├── models/
│   ├── post.dart
│   └── post.g.dart (生成されるファイル)
├── services/
│   ├── database_service.dart
│   ├── connectivity_service.dart
│   ├── api_service.dart
│   ├── sync_service.dart
│   └── timer_service.dart
├── repositories/
│   └── post_repository.dart
├── screens/
│   ├── main_screen.dart
│   └── create_post_screen.dart
└── utils/
    └── constants.dart
```

## 技術的検討事項

### Timer使用時の注意点

- アプリがバックグラウンドに移行したときの適切なTimer停止
- アプリが再表示されたときのTimer再開
- ウィジェットのライフサイクルとの連携
- メモリリークの防止

### Connectivity Plus使用時の注意点

- 複数の接続タイプの検出（WiFi, Mobile, VPN等）
- 接続状態変更の即座な検知
- 実際のインターネット接続の確認

### Isar使用時の注意点

- スキーマ変更時のマイグレーション戦略
- インデックスの適切な設定
- クエリパフォーマンスの最適化

### Dio使用時の注意点

- インターセプターの適切な設定（ログ、認証、エラーハンドリング）
- タイムアウト設定の最適化
- リトライ機構の実装
- レスポンスの型安全な処理

## API仕様（JSONplaceholder）

**エンドポイント**: `https://jsonplaceholder.typicode.com/posts`

**リクエスト形式**:

```json
{
  "title": "投稿のタイトル",
  "body": "投稿の本文",
  "userId": 1
}
```

**レスポンス形式**:

```json
{
  "id": 101,
  "title": "投稿のタイトル",
  "body": "投稿の本文",
  "userId": 1
}
```

## 開発環境要件

- Flutter SDK: 3.9.0以上
- Dart SDK: 3.9.0以上
- Android: API level 21以上
- iOS: iOS 12.0以上（将来対応）

## 想定される課題と対策

1. **Timer処理の制限**
   - 対策: アプリライフサイクルに連動したTimer制御とメモリリーク防止

2. **ネットワーク接続の不安定性**
   - 対策: リトライ機構とオフライン対応の実装

3. **データベースパフォーマンス**
   - 対策: 適切なインデックス設定とクエリ最適化

4. **メモリ使用量**
   - 対策: 大量データ処理時のバッチ処理実装

この実装計画に従って段階的に開発を進めることで、要件を満たすシンプルなサンプルアプリケーションを構築します。
