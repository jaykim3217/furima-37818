# users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| firstname          | string | null: false |
| lastname           | string | null: false |
| firstname_kana     | string | null: false |
| lastname_kana      | string | null: false |
| birthday           | date   | null: false |

- has_many :items
- has_many :buys

# items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| product            | string     | null: false |
| categori           | references | null: false, foreign_key: true |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |
| explain            | text       | null: false |
| condition          | references | null: false, foreign_key: true |
| postprice          | references | null: false, foreign_key: true |
| region             | references | null: false, foreign_key: true |
| deliveryday        | references | null: false, foreign_key: true |

- belongs_to :user
- has_one :buy
- belongs_to :categori
- belongs_to :condition
- belongs_to :postprice
- belongs_to :region
- belongs_to :deliveryday


# buys テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :delivery

# deliverys テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postalcode         | string     | null: false |
| region             | references | null: false, foreign_key: true |
| city               | string     | null: false |
| address            | string     | null: false |
| buildingname       | string     |             |
| phonenumber        | string     | null: false |
| buy                | references | null: false, foreign_key: true |

- belongs_to :buy
- belongs_to :region

# categories テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| categoryname       | string     | null: false |

- has_many :items

# conditions テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| item_condition     | string     | null: false |

- has_many :items

# postprices テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| who_postprice      | string     | null: false |

- has_many :items

# regions テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| from_region        | string     | null: false |

- has_many :items
- has_many :deliveries

# deliverydays テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| how_long           | string     | null: false |

- has_many :items


