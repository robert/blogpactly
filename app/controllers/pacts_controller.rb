class PactsController < ApplicationController
	def show
		@pacts = current_user.pacts
		@debtors = current_user.debts_as_debtor
		@creditors = current_user.debts_as_creditor
	end
end