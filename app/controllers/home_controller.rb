class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]
   def index
     @curr_user=current_user
     @encourses=@curr_user.courses.order('name')
  end
end
