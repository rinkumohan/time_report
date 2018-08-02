class Task < ApplicationRecord
  
  belongs_to :user
  belongs_to :project
  
  scope :under_project, -> (project_id) { where("project_id = ?", project_id) }
  
  validates :name, :time_taken, :date, :presence => true
  validates :time_taken, :numericality => { greater_than_or_equal_to: 0, less_than: 24 }

  def find_proj_name(id)
    Project.find_by_id(id).name
  end
  
  def self.find_user_tasks(tasks, id)  
    id.blank? ? tasks : tasks.under_project(id.to_i)
  end
  
end
