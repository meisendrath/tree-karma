class Contributor < ApplicationRecord
  belongs_to :user

  has_many :contributions

  validates :first_name, :last_name, presence: true
end
