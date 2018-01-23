class Contribution < ApplicationRecord
  belongs_to :contributor
  belongs_to :partner, optional: true
  belongs_to :item, polymorphic: true, optional: true

  monetize :price_cents, numericality: { greater_than: 0 }

  enum status: {
    pending: 0,
    accepted: 1,
    completed: 2
  }.freeze

  validates :partner, presence: true, unless: :pending?
  validates :item, :completed_at, presence: true, if: :completed?
  validates :stripe_id, presence: true
end
