class Photo < ApplicationRecord
  belongs_to :album

  validates :title, :url, :thumbnail_url, presence: true
end
