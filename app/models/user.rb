class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # ---------
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # ---------
  has_one :rss_feed
  # ---------
  has_and_belongs_to_many :pacts
  has_many :debts_as_debtor, foreign_key: :debtor_id, class_name: "Debt"
  has_many :debts_as_creditor, foreign_key: :creditor_id, class_name: "Debt"
  
end
