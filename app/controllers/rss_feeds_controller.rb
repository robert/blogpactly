class RssFeedsController < ApplicationController

  load_and_authorize_resource :rss_feed

  def show

  end

  def new

  end

  def create
    rss_feed = @current_user.create_rss_feed! params[:rss_feed]

    redirect_to rss_feed_path( rss_feed )
  end

end