class Partner < ApplicationRecord
  belongs_to :user
  belongs_to :location

  validates :company_name, presence: true
end
