#テーブル設計

## users table

| column             | Type      | Options       |
| ------------------ | --------- | ------------- |
| name               | string    | null: false   |
| email              | string    | null: false   |
| encrypted_password | string    | null: false   |
| last_name              | string    | null: false   |
| first_name              | string    | null: false   |
| last_name_kana              | string    | null: false   |
| first_name_kana              | string    | null: false   |
| birth_year              | integer    | null: false   |
| birth_month              | integer    | null: false   |
| birth_day              | integer    | null: false   |
### Association

- has_many :items
- has_many :orders


## items table

| column             | Type      | Options       |
| ------------------ | --------- | ------------- |
| image               | string    | null: false   |
| item_name              | string    | null: false   |
| description | text    | null: false   |
| category              | integer    | null: false   |
| condition              | integer    | null: false   |
| price              | integer    | null: false   |

### Association

- belongs_to :user
- has_one :order

## orders table

| column             | Type      | Options       |
| ------------------ | --------- | ------------- |
| user_id               | references    | null: false, external_key: true   |
| item_price              | references    | null: false, external_key: true   |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shipment


## shipments table

| column             | Type      | Options       |
| ------------------ | --------- | ------------- |
| postal_code               | string    | null: false   |
| prefecture              | integer    | null: false   |
| city | string    | null: false   |
| house_number | string    | null: false   |
| city | string    | null: false   |
| building |string     |    |
| telephone | string    | null: false   |

### Association

- belongs_to :order
