# 御朱印アプリケーション

## アプリケーションの概要

- 自分の御朱印を管理・検索できるアプリケーションです。

## [URL]

## テストアカウント

- メールアドレス:
- パスワード:

## 利用方法

- ユーザー登録
  - 新規登録画面からユーザー登録が行えます。
- 御朱印帳の登録
  - ユーザー登録後、御朱印帳の登録・編集・削除が行えます。
- 御朱印の登録
  - 御朱印帳の登録後、御朱印の登録・編集・削除が行えます。
- 御朱印の検索
  - 検索欄に神社名を入力して検索すると該当の御朱印を検索できます。
-log機能
  - 神社logから過去の御朱印を時系列で確認することができます。

## テーブル設計
### users テーブル

| Column            | Type     | Options           |
|:-----------------:|:--------:|:-----------------:|
| name              | string   | null: false       |
| email             | string   | null: false       |
| encrypted_password| string   | null: false       |

### albums テーブル

| Column       | Type    | Options         |
|:------------:|:-------:|:---------------:|
| image        | text    | null: false     |
| category     | string  | null: false     |

#### Association

- has_many :stamps

### stamps テーブル

| Column      | Type        | Options            |
|:-----------:|:-----------:|:------------------:|
| name        | string      | null: false        |
| album       | references  | foreign_key: true  |
| visit_day   | date        | null: false        |

#### Association

- belongs_to :album