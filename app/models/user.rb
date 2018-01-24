class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :contributor
  has_one :partner

  validates :email, presence: true
  validates :email, uniqueness: true

  accepts_nested_attributes_for :contributor
  accepts_nested_attributes_for :partner

  def contributor?
    contributor.present?
  end

  def partner?
    partner.present?
  end
end
