class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :from
  belongs_to :send_about
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id,   numericality: { other_than: 1 }
  validates :description, presence: true
  validates :postage_id,  numericality: { other_than: 1 }
  validates :from_id,     numericality: { other_than: 1 }
  validates :send_about_id, numericality: { other_than: 1 }
  validates :price, presence: true
end
