class PactsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :pact, through: :user, except: [ :new, :create ]

  def index
		@debtors = current_user.debts_as_debtor
		@creditors = current_user.debts_as_creditor
  end

  def show
    @pact = @pact.decorate
	end

  def new
  end

  def create
  end

end