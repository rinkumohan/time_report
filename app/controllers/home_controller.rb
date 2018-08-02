class HomeController < ApplicationController
  
  before_action :find_user_tasks, only: [:index]
  
  def index
    @tasks = Task.find_user_tasks(@tasks, params[:project_id])
  end
  
  private 
  
  def find_user_tasks
    @tasks = current_user.try(:tasks)
  end  
  
end
