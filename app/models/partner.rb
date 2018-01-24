class Partner < ApplicationRecord
  belongs_to :user
  belongs_to :location

  has_many :contributions

  validates :company_name, presence: true

  accepts_nested_attributes_for :location
end
