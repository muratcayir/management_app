class Company < ApplicationRecord
  belongs_to :user
  validates :name, :catch_phrase, :bs, presence: true
end
