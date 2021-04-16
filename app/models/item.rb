class Item < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :from
  belongs_to :send_about
end
