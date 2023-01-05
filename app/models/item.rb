class Item < ApplicationRecord
  belongs_to :user

  has_many :store_items
  has_many :stores, through: :store_items
end
