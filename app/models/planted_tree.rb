class PlantedTree < ApplicationRecord
  belongs_to :location

  has_attached_file :image,
    styles: { thumbnail: '100x100#' },
    convert_options: { thumbnail: '-quality 75 -strip' }

  validates_attachment :image,
    presence: true,
    content_type: { content_type: ['image/jpeg', 'image/png', 'image/jpg'] }

  validates :name, :planted_date, :planted_age_years, presence: true
end
