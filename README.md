# Bookers2

## アプリケーション概要
本に対する評価・レビューを共有できるサービスです。
5段階評価やカテゴリタグによる検索など、本選びの参考になる機能を提供します。

## URL
http://localhost:8080

## テスト用アカウント
| 項目 | 内容 |
|------|------|
| メールアドレス | test@example.com |
| パスワード | password |

## 使用技術
| 技術 | バージョン |
|------|-----------|
| Ruby | 3.3.6 |
| Ruby on Rails | 8.0.4 |
| Bootstrap | 5.3 |
| Raty.js | 4.3.0 |

## 機能一覧
- ユーザー登録・ログイン
- 本の投稿・編集・削除
- 5段階評価（Raty.js使用）
- 評価順・新着順の並び替え
- カテゴリタグの追加・タグ検索
- いいね機能
- コメント機能
- フォロー・フォロワー機能
- チャット機能
- 閲覧数カウント

## ER図
![ER図]()

## 画面遷移図
![画面遷移図]()

## ローカル環境での起動方法
```bash
git clone https://github.com/xxxxxxxx/Bookers2.git
cd Bookers2
bundle install
rails db:create db:migrate
rails server
```

## 工夫した点
- Raty.jsを使った直感的な星評価UI
- カテゴリタグで本のジャンルを素早く検索できる機能
- 評価順・新着順の切り替えで使いやすい一覧表示