class Debt < ActiveRecord::Base

  belongs_to :debtor, class_name: "User"
  belongs_to :creditor, class_name: "User"
  belongs_to :pact

end
