# users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

- has_many :items
- has_many :buys

# items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| product            | string     | null: false |
| category_id        | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |
| explain            | text       | null: false |
| condition_id       | integer    | null: false |
| post_price_id      | integer    | null: false |
| region_id          | integer    | null: false |
| delivery_day_id    | integer    | null: false |

- belongs_to :user
- has_one :buy


# buys テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :delivery

# deliveries テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false |
| region_id          | integer    | null: false |
| city               | string     | null: false |
| address            | string     | null: false |
| building_name      | string     |             |
| phone_number       | string     | null: false |
| buy                | references | null: false, foreign_key: true |

- belongs_to :buy



