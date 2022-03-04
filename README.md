# テーブル設計

## users テーブル

| Column                 | Type   | Options                  |
| ---------------------- | ------ | ------------------------ |
| nickname               | string | null: false              |
| email                  | string | null: false,unique: true |
| encrypted_password     | string | null: false              |
| last_name_kanji        | string | null: false              |
| first_name_kanji       | string | null: false              |
| last_name_katakana     | string | null: false              |
| first_name_katakana    | string | null: false              |
| birthday               | date   | null: false              |

### Association

  has_many :items
  has_many :purchases


## items テーブル

| Column                    | Type        | Options     |
| ------------------------- | ----------- | ----------- |
| item_name                 | string      | null: false |
| text                      | text        | null: false |
| category_id               | integer     | null: false |
| item_state_id             | integer     | null: false |
| shipping_cost_bearer_id   | integer     | null: false |
| prefectures_id            | integer     | null: false |
| shipping_days_id          | integer     | null: false |
| price                     | integer    | null: false |
| user                      | references  | null: false |

### Association

  belongs_to :user
  has_one :purchase


## purchases テーブル

| Column            | Type       | Options                        |
| ------------------| ---------- | ------------------------------ |
| item              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association

  belongs_to :user
  belongs_to :item
  has_one :shipping_address


## shipping_addresses テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| postal_code            | string     | null: false                    |
| prefectures_id         | integer    | null: false                    |
| municipalities         | string     | null: false                    |
| address                | string     | null: false                    |
| building_name          | string     |                                |
| tel                    | string     | null: false                    |
| purchase               | references | null: false, foreign_key: true |

### Association

  belongs_to :purchase
