class Partner < ApplicationRecord
  belongs_to :user
  belongs_to :location

  has_many :contributions

  validates :company_name, presence: true
end
