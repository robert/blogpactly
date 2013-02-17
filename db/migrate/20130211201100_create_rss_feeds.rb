class CreateRssFeeds < ActiveRecord::Migration
  def change
    create_table :rss_feeds do |t|
      t.integer :user_id
      t.string :url
      t.string :title

      t.timestamps
    end
  end
end
