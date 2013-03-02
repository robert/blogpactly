user1 = User.create(name: 'Mu-An Chiou', email: 'r@muan.co', password: '12345678')
user2 = User.create(name: 'Robert Heaton', email: 'bobjheaton@gmail.com', password: '12345678')
user3 = User.create(name: 'John Ngo', email: 'john@smallepic.com', password: '12345678')

user1_rss_feed = RssFeed.create(url: 'http://muan.co/feed.xml', title: 'How Nice!') do |feed|
  feed.user_id = user1.id
end
user2_rss_feed = RssFeed.create(url: 'http://robertheaton.com/feed.xml', title: 'Rob Heaton') do |feed|
  feed.user_id = user2.id
end
user3_rss_feed = RssFeed.create(url: 'http://feeds.feedburner.com/non-profiteer', title: 'The Non-Profiteer') do |feed|
  feed.user_id = user3.id
end

pact1 = Pact.create(users: [user1, user2], created_at: 4.weeks.ago)
pact2 = Pact.create(users: [user2, user3], created_at: 5.weeks.ago)

Debt.create(pact: pact1, amount: 5, user1: user1, user2: user2, marked_as_paid_by_user1: true, marked_as_paid_by_user2: true)
Debt.create(pact: pact1, amount: 5, user1: user2, user2: user1)