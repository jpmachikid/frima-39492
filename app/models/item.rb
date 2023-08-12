class Item < ApplicationRecord
  with_options presence: true do
    validates :user
    validates :item_name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price
  end

  belongs_to :user
end
