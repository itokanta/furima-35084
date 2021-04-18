class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :from
  belongs_to :sendabout
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 40 }
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id,   numericality: { other_than: 1 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :postage_id,  numericality: { other_than: 1 }
  validates :from_id,     numericality: { other_than: 0 }
  validates :sendabout_id, numericality: { other_than: 1 }
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ },
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true
end
