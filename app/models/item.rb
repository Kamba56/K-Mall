class Item < ApplicationRecord
  belongs_to :user

  has_many :store_items
  has_many :stores, through: :store_items

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
