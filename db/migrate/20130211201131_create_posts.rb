class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :rss_feed_id
      t.string :title
      t.string :snippet
      t.string :url
      t.datetime :published_at

      t.timestamps
    end
  end
end
