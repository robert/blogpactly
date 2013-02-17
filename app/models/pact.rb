class Pact < ActiveRecord::Base
	attr_accessible :created_at, :users

	has_and_belongs_to_many :users
	has_many :debts
end