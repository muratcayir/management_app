class Address < ApplicationRecord
  belongs_to :user

  validates :street, :suite, :city, :zipcode, :lat, :lng, presence: true
end
