# content-share

# DB設計

## usersテーブル 

| Column   | Type   | Options                  |
| -------- | ------ | ------------------------ |
| nickname | string | null: false              |
| email    | string | null: false, unique: true|
| password | string | null: false              |

### Association
- has_many :posts
- has_many :contents

<br>

## postsテーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| name      | string     | null: false |
| published | integer    | null: false |
| user      | references | null: false, foreign_key: true |

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

## contentsテーブル
| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| comment    | text        | 			                    |
| image      | string	   |
| user       | references  | null: false, foreign_key: true |
| post       | references  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post

<br>


