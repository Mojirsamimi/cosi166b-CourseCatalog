class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]
   def index
     @curr_user=current_user
  end
end
