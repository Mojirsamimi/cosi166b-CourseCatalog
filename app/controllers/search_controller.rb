class SearchController < ApplicationController
  before_action :authenticate_user!
   def index
     @curr_user=current_user
     @subjects=Subject.order(:name)
  end
  def result
    if params[:search][:subject]==''
      @courses=Course.search(params[:search][:course]).order('name')
    else
     courses1=Subject.find(params[:search][:subject]).courses
     @courses=courses1.search(params[:search][:course]).order('name')
    end
  end
  
  def searchcourse
    @curr_user=current_user
    @subjects=Subject.order(:name)
  end
  def dosearchcourse
     if params[:subject]==''
      @courses=Course.search(params[:course]).order('name')
    else
     courses1=Subject.find(params[:subject]).courses
     @courses=courses1.search(params[:course]).order('name')
    end
    respond_to do |format|
      format.js
    end
  end
  def is_enrolled(course_id)
    if current_user.courses.include?(Course.find(course_id))
      return true
    else
      return false
    end
  end
  helper_method :is_enrolled
end
