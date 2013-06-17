class HomeController < ApplicationController

skip_before_filter :init_user, :only => :index	

  def index
  	@rooms = Room.all
  end
end
