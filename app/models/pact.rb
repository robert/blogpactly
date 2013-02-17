class Pact < ActiveRecord::Base

	attr_accessible :created_at, :users
  
  has_and_belongs_to_many :users
  # -----------
  has_many :debts
  # -----------
  before_create :set_defaults

  def process_if_necessary
    if last_processed_at < last_period_end
      inspect_feeds_and_create_debts_for_last_period
      self.last_processed_at = Time.now
      save!
    else
      false
    end
  end

  def last_period_start
    Time.now.beginning_of_week - 7.days
  end

  def last_period_end
    last_period_start + 7.days
  end

  private
    def set_defaults
      self.last_processed_at = Time.now
    end

    def inspect_feeds_and_create_debts_for_last_period
      users_who_posted = []
      users_who_failed_to_post = []
      users.each do |user|
        if user.rss_feed.new_post_between? last_period_start, last_period_end
          users_who_posted << user
        else
          users_who_failed_to_post << user
        end
      end

      unless users_who_posted.empty? || users_who_failed_to_post.empty?
        users_who_failed_to_post.each do |failure_user|
          users_who_posted.each do |poster_user|
            debts.create! do |debt|
              debt.debtor = failure_user
              debt.creditor = poster_user
            end
          end
        end
      end
    end

end