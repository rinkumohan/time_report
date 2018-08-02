class Task < ApplicationRecord
  
  belongs_to :user
  belongs_to :project

  validates :name, :time_taken, :date, :presence => true
  validates :time_taken, :numericality => { greater_than_or_equal_to: 0, less_than: 24 }

  def find_proj_name(id)
    Project.find_by_id(id).name
  end
  
  def self.find_user_tasks(user,id)
    (id==0) ? user.tasks : user.tasks.where("project_id = ?",id)
  end
  
end
