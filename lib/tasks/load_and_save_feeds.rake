desc "run delayed jobs; to be used with the Heroku scheduler on staging server every 10 minutes to avoid paying a worker dyno"
task load_and_save_feeds: :environment do
  Rails.logger.info "Start fetching feeds"
  
  RssFeed.find_each do |rss_feed|
    rss_feed.fetch_and_save_new_posts
  end

  Rails.logger.info "Finished fetching feeds"
  Rails.logger.info "Inspecting pacts"

  Pact.find_each do |pact|
    if pact.process_if_necessary
      puts "Processed PACT #{ pact.id }"
    end
  end

  Rails.logger.info "Finished inspecting pacts"
end
