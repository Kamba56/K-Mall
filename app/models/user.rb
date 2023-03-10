class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :stores
  has_many :items

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :email, :password, presence: true
end
