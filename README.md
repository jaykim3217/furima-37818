# users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| firstname          | string | null: false |
| lastname           | string | null: false |
| firstname_kana     | string | null: false |
| lastname_kana      | string | null: false |
| birth_year         | string | null: false |
| birth_month        | string | null: false |
| birth_date         | string | null: false |

- has_many :items
- has_many :buys

# items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| product            | string     | null: false |
| categori           | text       | null: false |
| price              | text       | null: false |
| user               | references | null: false, foreign_key: true |
| explain            | text       | null: false |
| condition          | text       | null: false |
| postprice          | string     | null: false |
| region             | string     | null: false |
| deliverdays        | string     | null: false |

- belongs_to :user
- has_one :buy

# buys テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| product            | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :delivery

# deliverys テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postalcode         | string     | null: false |
| prefecture         | string     | null: false |
| city               | string     | null: false |
| address            | string     | null: false |
| buildingname       | string     |             |
| phonenumber        | string     | null: false |
| user               | references | null: false, foreign_key: true |

- belongs_to :buy