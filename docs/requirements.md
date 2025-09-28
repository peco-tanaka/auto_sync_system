# Requirements

## Overview

`connectivity_plus`のネット接続機能を試すためのサンプルアプリです。
`Isar`で保存したデータを、仮のAPI（`JSONplaceholder`）に定期的に送信することを想定しています。
時間管理には`Timar`を使用し、15分おきに未同期データをチェックして送信します。
公式ドキュメントに基づいた、シンプルな実装を目指します。

## Main Packages

- connectivity_plus: 7.0.0
- isar: 3.1.0+1
- dio: 5.9.0

## API Endpoint

`Jsonplaceholder`のエンドポイントを使用します
