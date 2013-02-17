class ApplicationController < ActionController::Base
	protect_from_forgery
  
  private
    def after_sign_in_path_for (resource)
      if current_user.pacts.any?
        user_pact_path(current_user, current_user.pacts.first)
      else
        new_rss_feed_path
      end
    end
end