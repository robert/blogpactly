class Post < ActiveRecord::Base

  attr_accessible :snippet, :title, :url
  # ---------
  belongs_to :rss_feed
  # ---------
  validate :is_not_duplicate

  def published_at
    read_attribute( :published_at ) || created_at
  end

  private
    def is_not_duplicate
      if rss_feed.posts.find(:all, conditions: { snippet: snippet, title: title }).any?
        errors.add(:title, "This appears to be a duplicate post")
      end
    end

end
