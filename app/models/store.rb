class Store < ApplicationRecord
  belongs_to :user

  has_many :store_items
  has_many :items, through: :store_items
end
