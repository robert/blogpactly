class PagesController < ApplicationController

  def home
    if user_signed_in?
      if current_user.pacts.any?
        redirect_to user_pact_path( current_user, current_user.pacts.first )
      else
        redirect_to new_pact_path
      end
    end
  end

end