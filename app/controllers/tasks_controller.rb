class TasksController < ApplicationController
  
  before_action :find_project, only: [:index,:new]
  before_action :find_task, only: [:edit,:update,:destroy]
  
  def index
    @tasks = @project.tasks
    respond_to do |format|
      format.html
      format.xlsx {render :xlsx => "index", :filename =>"timesheet_report_#{current_user.email}"}
    end  
  end
  
  def new
    @task = Task.new
  end
  
  def edit
    @project = Project.find_by_id(@task.project_id)
  end
  
  def create
    @task = Task.new(task_params.merge(:user_id => current_user.id))
    if @task.save
      flash[:success] = "Successfully Created Task"
      redirect_to tasks_path(project_id: @task.project_id)
    else
      flash[:error] = @task.errors.full_messages.uniq.join(', ')
      redirect_to new_task_path(project_id: @task.project_id)
    end
  end
  
  def update
    task = @task.update_attributes(task_params)
    if task
      flash[:success] = "Successfully Updated Task"
      redirect_to tasks_path(project_id: @task.project_id)
    else
      flash[:error] = @task.errors.full_messages.uniq.join(', ')
      redirect_to edit_task_path(project_id: @task.project_id)
    end
  end
  
  def destroy
    delete_task = @task.delete
    flash[:success] = "Successfully Deleted Task" if delete_task
    flash[:error] = @task.errors.full_messages.uniq.join(', ') if !delete_task
    redirect_to tasks_path(project_id: @task.project_id)
  end
  
  private
    
  def task_params
    params.require(:task).permit(:name,:description,:user_id,:project_id,:time_taken,:date)
  end
  
  def find_project
    @project = Project.find_by_id(params[:project_id])
  end  
  
  def find_task
    @task = Task.find_by_id(params[:id])
  end

end
