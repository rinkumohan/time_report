class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.float :time_taken
      t.references :user
      t.references :project
      t.date :date
      t.timestamps
    end
  end
end
