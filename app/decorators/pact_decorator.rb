class PactDecorator < Draper::Decorator
  include Draper::LazyHelpers
  decorates_association :users
  decorates_finders 
  delegate_all

  def current_stand
    if total_change_hands > 0 
      "#{model.users.first.name} has won &pound;#{total_change_hands} so far.".html_safe
    elsif total_change_hands < 0
      "#{model.users.first.name} has lost &pound;#{total_change_hands.abs} so far.".html_safe
    else
      "Currently even."
    end
  end

  def date_of_weekends
    dates = []
    started_on = model.created_at.sunday.to_date
    while started_on < Date.today
      started_on = started_on + 1.week
      dates << started_on
    end
    dates = dates.reverse
  end

  def log
    i = weeks_so_far + 1
    data = []
    for date in date_of_weekends
      data << { 
        date: date, 
        post_by_user1: model.users.first.rss_feed.posts.find{ |post| post.published_at < date && post.published_at > date - 1.week }, 
        post_by_user2: model.users.last.rss_feed.posts.find{ |post| post.published_at < date && post.published_at > date - 1.week }
      }
    end
    data
  end

  def owed_by_user1
    owed = 0
    log.each do |row|
      unless row[:date] > Date.today
        owed = owed + 5 if row[:post_by_user1].present? && row[:post_by_user2].nil?
      end
    end
    owed
  end

  def owed_by_user2
    owed = 0
    log.each do |row|
      unless row[:date] > Date.today
        owed = owed + 5 if row[:post_by_user1].nil? && row[:post_by_user2].present?
      end
    end
    owed
  end

  def weeks_so_far
    date_of_weekends.length
  end

  def total_change_hands
    owed_by_user1 - owed_by_user2
  end

end
