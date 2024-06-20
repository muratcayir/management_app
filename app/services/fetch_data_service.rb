class FetchDataService
  def self.fetch_all_data
    UserFetcher.new.fetch_and_save_users
  end
end
