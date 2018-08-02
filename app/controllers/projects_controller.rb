class ProjectsController < ApplicationController
  
  before_action :find_project, only: [:edit,:update,:destroy]
  
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end
  
  def edit
    
  end
  
  def create
    @project = Project.new(project_params.merge(:user_id => current_user.id))
    if @project.save
      flash[:success] = "Successfully Created Project"
      redirect_to projects_path
    else
      flash[:error] = @project.errors.full_messages.uniq.join(', ')
      redirect_to new_project_path
    end
  end
  
  def update
    proj = @project.update_attributes(project_params)
    if proj
      flash[:success] = "Successfully Updated Project"
      redirect_to projects_path
    else
      flash[:error] = @project.errors.full_messages.uniq.join(', ')
      redirect_to edit_project_path
    end
  end
  
  def destroy
    delete_proj = @project.destroy
    flash[:success] = "Successfully Deleted Project" if delete_proj
    flash[:error] = @project.errors.full_messages.uniq.join(', ') if !delete_proj
    redirect_to projects_path
  end
  
  private
    
  def project_params
    params.require(:project).permit(:name,:description,:user_id)
  end
  
  def find_project
    @project = Project.find_by_id(params[:id])
  end

end
