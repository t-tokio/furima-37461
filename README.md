# テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false |
| encrypted_password     | string | null: false |
| last_name_kanji        | string | null: false |
| first_name_kanji       | string | null: false |
| last_name_katakana     | string | null: false |
| first_name_katakana    | string | null: false |
| birthday               | date   | null: false |

### Association

  has_many :items
  has_many :purchases


## items テーブル

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| item_name              | string     | null: false |
| text                   | text       | null: false |
| category               | string     | null: false |
| item_state             | string     | null: false |
| price                  | interger   | null: false |
| user                   | references | null: false |

### Association

  belongs_to :user
  has_one :purchase


## purchases テーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| item              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |
| price             | interger   | null: false |

### Association

  belongs_to :user
  belongs_to :item


## shipping_addresses テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| postal_code            | string     | null: false                    |
| prefectures            | string     | null: false                    |
| municipalities         | string     | null: false                    |
| address                | string     | null: false                    |
| building_name          | string     | null: false                    |
| tel                    | interger   | null: false                    |
| purchase               | references | null: false, foreign_key: true |

### Association

  belongs_to :purchase
