require 'httparty'
require 'active_support/core_ext/hash/keys'

class PhotoFetcher
  include HTTParty
  base_uri 'https://jsonplaceholder.typicode.com'

  def fetch_and_save_photos(album, album_id)
    photos = self.class.get("/photos?albumId=#{album_id}")
    photos.each do |photo_data|
      photo_data.deep_transform_keys! { |key| key.underscore }
      photo = album.photos.find_or_initialize_by(id: photo_data['id'])
      photo.assign_attributes(
        title: photo_data['title'],
        url: photo_data['url'],
        thumbnail_url: photo_data['thumbnail_url']
      )
      photo.save!
    end
  end
end
