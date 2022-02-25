class Dog < ApplicationRecord
  geocoded_by :address
  belongs_to :user
  has_one_attached :photo
  after_validation :geocode
end
