class HomeController < ApplicationController
  
  def index
    proj_id = params[:project_id].to_i
    @tasks = Task.find_user_tasks(current_user,proj_id)
  end
  
end
