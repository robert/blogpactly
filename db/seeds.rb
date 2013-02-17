# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

creditor = User.create(name: 'Doyle Brunson', email: 'doyle@brunson.com', password: 'supersystem')
debtor = User.create(name: 'Howard Lederer', email: 'howard@lederer.com', password: 'theprofessor')
creditor_rss_feed = RssFeed.create(url: 'http://brunson.com/feed.xml', title: 'Super System') do |feed|
  feed.user_id = creditor.id
end
debtor_rss_feed = RssFeed.create(url: 'http://lederer.com/feed.xml', title: 'The Professor') do |feed|
  feed.user_id = debtor.id
end

pact = Pact.create(users: [creditor, debtor], created_at: 10.weeks.ago)

Debt.create(pact: pact, amount: 5, creditor: creditor, debtor: debtor, marked_as_paid_by_creditor: true, marked_as_paid_by_debtor: true)
Debt.create(pact: pact, amount: 5, creditor: debtor, debtor: creditor)