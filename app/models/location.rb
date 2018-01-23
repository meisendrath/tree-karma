class Location < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  validates :latitude, :longitude, presence: true
end
