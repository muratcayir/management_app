require 'httparty'
require 'active_support/core_ext/hash/keys'

class AlbumFetcher
  include HTTParty
  base_uri 'https://jsonplaceholder.typicode.com'

  def fetch_and_save_albums(user, user_id)
    albums = self.class.get("/albums?userId=#{user_id}")
    albums.each do |album_data|
      album_data.deep_transform_keys! { |key| key.underscore }
      album = user.albums.find_or_initialize_by(id: album_data['id'])
      album.assign_attributes(title: album_data['title'])
      album.save!
      PhotoFetcher.new.fetch_and_save_photos(album, album_data['id'])
    end
  end
end
