class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :from_id, :city, :address, :build_name, :phone, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :from_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone, length: {maximum: 11}, format: {with: /\A[0-9]+\z/}
    validates :token
  end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, from_id: from_id, city: city, address: address, build_name: build_name, phone: phone, buy_id: buy.id)
  end
end