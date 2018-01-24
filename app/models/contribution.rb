class Contribution < ApplicationRecord
  belongs_to :contributor
  belongs_to :partner, optional: true
  belongs_to :item, polymorphic: true, optional: true, autosave: true

  monetize :price_cents, numericality: { greater_than: 0 }

  enum status: {
    temporal: 0,
    pending: 1,
    accepted: 2,
    completed: 3
  }.freeze

  validates :partner, presence: true, if: -> { accepted? && completed? }
  validates :item, :completed_at, presence: true, if: :completed?
  validates :stripe_id, presence: true, unless: :temporal?
end
