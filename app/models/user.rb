class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :contributor

  validates :email, presence: true
  validates :email, uniqueness: true

  accepts_nested_attributes_for :contributor
end
