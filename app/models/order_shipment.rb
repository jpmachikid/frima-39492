class OrderShipment

  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal_code,:prefecture_id,:city,:house_number,:building,:telephone
  
  with_options presence: true do
    validates :postal_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :telephone,format: {with: /\A\d{10,11}\z/}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipment.create(postal_code: postal_code,prefecture_id: prefecture_id,city: city,house_number: house_number,building: building,telephone: telephone,order_id: order.id)
  end

end