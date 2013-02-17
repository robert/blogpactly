class RssFeedsController < ApplicationController

  load_and_authorize_resource :rss_feed

  layout "devise", only: :new

  def show

  end

  def new

  end

  def create
    rss_feed = @current_user.create_rss_feed! params[:rss_feed]
    redirect_to new_pact_path
  end

end