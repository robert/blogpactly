class RssFeed < ActiveRecord::Base

  attr_accessible :url, :title
  # ---------
  belongs_to :user
  # ---------
  has_many :posts
  # ---------

  def feedzirra_feed
    Feedzirra::Feed.fetch_and_parse url
  end

  def fetch_and_save_new_posts
    new_posts = []
    feedzirra_feed.entries.each do |entry|
      new_post = posts.build({
        title:        entry.title.sanitize,
        url:          entry.url,
        snippet:      entry.summary
      }) do |post|
        post.published_at = entry.published
      end

      new_posts << new_post if new_post.save
    end
    new_posts
  end

  def new_post_between? start, finish
    posts.where('published_at > ? AND published_at < ?', start, finish).any?
  end

end
