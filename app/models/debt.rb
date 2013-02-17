class Debt < ActiveRecord::Base
	# Attributes

	attr_accessible :amount, :creditor, :debtor, :marked_as_paid_by_creditor, :marked_as_paid_by_debtor, :pact

	# Associations

	belongs_to :debtor, class_name: 'User'
	belongs_to :creditor, class_name: 'User'
	belongs_to :pact

	# Scopes
	scope :reverse_chronological, order(:created_at).reverse_order

  before_create :set_defaults

  # Instance Methods
  def paid?
    self.marked_as_paid_by_creditor? and self.marked_as_paid_by_debtor?
  end

  private
    def set_defaults
      self.amount = 5
      self.marked_as_paid_by_creditor = false
      self.marked_as_paid_by_debtor = false
      true
    end

end