
class StaticPagesController < ApplicationController
  #before_filter :signed_in_user, only: [:home, :edit, :update, :destroy]  
  before_filter :authenticate_user!, only: [:home, :edit, :update, :destroy]  
  
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
