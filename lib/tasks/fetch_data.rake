namespace :fetch_data do
  desc 'Fetch users, albums, and photos from JSONPlaceholder API and save to database'
  task fetch: :environment do
    FetchDataService.fetch_all_data
    puts 'Data has been fetched and saved to the database.'
  end
end
