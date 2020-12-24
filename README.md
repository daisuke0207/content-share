# Share

## DEMO

### トップページ
![share_top_page](https://user-images.githubusercontent.com/61821997/103079009-699c2e00-4616-11eb-9b76-d2712fb3de80.gif)
<br>

### 投稿詳細ページ、コメント送信・削除機能
![share_show_comment](https://user-images.githubusercontent.com/61821997/103078747-db27ac80-4615-11eb-862a-2379dc94a709.gif)
<br>

### 新規投稿ページ
![share_new_post](https://user-images.githubusercontent.com/61821997/103078762-e11d8d80-4615-11eb-8c89-b6f44c0713d6.gif)
<br>

# DB設計

## usersテーブル 

| Column   | Type   | Options                  |
| -------- | ------ | ------------------------ |
| nickname | string | null: false              |
| email    | string | null: false, unique: true|
| password | string | null: false              |

### Association
- has_many :posts
- has_many :comments
- has_many :replies

<br>

## postsテーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| title      | string     | null: false |
| body       | text       | null: false |
| is_publish | boolean    | null: false |
| user       | references | null: false, foreign_key: true |

### Association
- has_many :contents
- has_many :tags, through: :post_tags

<br>

## post_tagsテーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| post     | references | null: false, foreign_key: true |
| tag      | references | null: false, foreign_key: true |

### Association
- belongs_to :post
- belongs_to :tag

<br>

## tagsテーブル

| Column   | Type        | Options                        |
| -------- | ----------- | ------------------------------ |
| name     | string      | null: false                    |
| post     | references  | null: false, foreign_key: true |

### Association
- has_many :post, through: :post_tags

<br>

## commentsテーブル
| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| body       | text        | 			                    |
| user       | references  | null: false, foreign_key: true |
| post       | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post

<br>

## repliesテーブル
| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| body           | text        | null: false	                |
| user           | references  | null: false, foreign_key: true |
| comment_parent | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :comment



