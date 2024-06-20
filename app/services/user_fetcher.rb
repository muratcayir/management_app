require 'httparty'
require 'active_support/core_ext/hash/keys'

class UserFetcher
  include HTTParty
  base_uri 'https://jsonplaceholder.typicode.com'

  def fetch_and_save_users
    users = self.class.get('/users')
    users.each do |user_data|
      user_data.deep_transform_keys! { |key| key.underscore }
      user = User.find_or_initialize_by(id: user_data['id'])
      user.assign_attributes(
        name: user_data['name'],
        username: user_data['username'],
        email: user_data['email'],
        phone: user_data['phone'],
        website: user_data['website'],
        address_attributes: {
          street: user_data['address']['street'],
          suite: user_data['address']['suite'],
          city: user_data['address']['city'],
          zipcode: user_data['address']['zipcode'],
          lat: user_data['address']['geo']['lat'],
          lng: user_data['address']['geo']['lng']
        },
        company_attributes: {
          name: user_data['company']['name'],
          catch_phrase: user_data['company']['catch_phrase'],
          bs: user_data['company']['bs']
        }
      )
      user.save!
      AlbumFetcher.new.fetch_and_save_albums(user, user_data['id'])
    end
  end
end
