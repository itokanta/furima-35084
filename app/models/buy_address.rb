class BuyAddress
  include ActiveModel::Model
  attr_accessor :item, :user, :postal_code, :from, :cities, :address, :build_name, :phone

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :from, numericality: {other_than: 1, "can't be blank"}
    validates :cities
    validates :address
    validates :phone, length: {maximum: 11}, format: {with: /\A[0-9]+\z/}
  end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, from: from, cities: cities, address: address, build_name: build_name, phone: phone, buy_id: buy_id)
end