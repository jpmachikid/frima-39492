class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :price, format: {with: /\A[0-9]+\z/}, numericality: { greater_than: 299, less_than: 10_000_000}
    validates :image
  end
 
  belongs_to :condition
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :shipping_fee

  belongs_to :user
  has_one_attached :image
end
