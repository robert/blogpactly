# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

creditor = User.create(email: 'doyle@brunson.com', password: 'supersystem')
debtor = User.create(email: 'howard@lederer.com', password: 'theprofessor')
pact = Pact.create(users: [creditor, debtor], created_at: 10.weeks.ago)

Debt.create(pact: pact, amount: 5, creditor: creditor, debtor: debtor, marked_as_paid_by_creditor: true, marked_as_paid_by_debtor: true)
Debt.create(pact: pact, amount: 5, creditor: debtor, debtor: creditor)