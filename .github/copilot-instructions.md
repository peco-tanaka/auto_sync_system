# 全てのプロンプトでこのファイル内容を参照して下さい

# プロジェクト概要 / Project Overview

`workmanager`と`connectivity_plus`の機能を試すためのサンプルアプリです。
`Isar`で保存したデータを、仮のAPI（`JSONplaceholder`）に送信することを想定しています。

## Basic Rules

順守すべき基本的な規約を以下に示します

- 英語で思考し、日本語で回答します
- 破壊的な変更を行うときは必ず確認をとって下さい
- タスクは細分化します
  - コーディングする時は細分化されたタスクに対して、更に細かな粒度で実装します
  - 一度のプロンプトから一度に大量のコードを生成しないでください
- ファイルの先頭にあるimport文を必ず確認して下さい
- ライブラリの導入はコマンドによる導入を優先してください

## コーディング規約 / Cosding Standards

コーディングする時には以下の規約を遵守して下さい

- **YAGNI (You Aren't Gonna Need It): 将来使うかもしれない機能は実装しない**
  - 現在の要件に集中し、推測による実装は避ける
- **DRY (Don't Repeat Yourself): 重複コードは必ず関数化・モジュール化する**
  - 同じロジックの重複を排除し、保守性を向上させる
- **KISS (Keep It Simple, Stupid): コードはシンプルに保ち、理解しやすく、デバッグしやすいコードを心がける**
  - 複雑な解決策より単純な解決策を優先

## Agent mode の規約 / Agentic coding rules

以下のワークフローに沿ってコーディングを行って下さい

1. タスクは非常に細かい粒度で実装します。一度のプロンプトから大量のコードを生成してはいけません
2. 実装計画に基づいた分析を行い、コーディング前に実装する概要を詳細に説明して下さい。開発者の承認を得るまで、決して実装を進めてはなりません
3. 1つのタスクが完了したら、一度立ち止まり、実装した内容を詳細に説明してください。実装のロングランは禁止します

## MCP Server の利用順守 / Use of MCP Server

適切なタイミングで、積極的にMCP Serverを呼び出して使用してください

### Context7 MCP

- 使用できる状況では常に Context7 を使用し、常に最新のドキュメントに基づいて実装をしてください。use context7
- 参照したソースは必ず解答の最後に引用元として URL を記載して下さい

### fetch MCP 利用の順守

- 開発者から URL を渡されたときには必ず fetch MCP を利用して下さい
- web 検索など、外部から情報を取得するときには必ず fetch MCP を利用して下さい
- 参照したソースは必ず解答の最後に引用元として URL を記載して下さい

## 技術スタック / Tech stack in use

- Flutter 最新
- workmanager: 0.9.0+3
- connectivity_plus: 7.0.0
- isar: 3.1.0+1

## The following instructions are only to be applied when performing a code review.

### Prompt file guide

**Only apply to files that end in `.prompt.md`**

* [ ] The prompt has markdown front matter.
* [ ] The prompt has a `mode` field specified of either `agent` or `ask`.
* [ ] The prompt has a `description` field.
* [ ] The `description` field is not empty.
* [ ] The `description` field value is wrapped in single quotes.
* [ ] The file name is lower case, with words separated by hyphens.
* [ ] Encourage the use of `tools`, but it's not required.
* [ ] Strongly encourage the use of `model` to specify the model that the prompt is optimised for.

### Instruction file guide

**Only apply to files that end in `.instructions.md`**

* [ ] The instruction has markdown front matter.
* [ ] The instruction has a `description` field.
* [ ] The `description` field is not empty.
* [ ] The `description` field value is wrapped in single quotes.
* [ ] The file name is lower case, with words separated by hyphens.
* [ ] The instruction has an `applyTo` field that specifies the file or files to which the instructions apply. If they wish to specify multiple file paths they should formated like `'**.js, **.ts'`.

### Chat Mode file guide

**Only apply to files that end in `.chatmode.md`**

* [ ] The chat mode has markdown front matter.
* [ ] The chat mode has a `description` field.
* [ ] The `description` field is not empty.
* [ ] The `description` field value is wrapped in single quotes.
* [ ] The file name is lower case, with words separated by hyphens.
* [ ] Encourage the use of `tools`, but it's not required.
* [ ] Strongly encourage the use of `model` to specify the model that the chat mode is optimised for.
