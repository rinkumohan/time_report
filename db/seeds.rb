# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if ActiveRecord::Base.connection.table_exists? 'users'
  if User.all.blank?
    ActiveRecord::Base.connection.execute 'ALTER SEQUENCE users_id_seq RESTART WITH 1;'
    user = User.new(
          :email                 => "admin@abc.com",
          :password              => "123456",
          :password_confirmation => "123456"
      )
      user.save!
   end   
end

if ActiveRecord::Base.connection.table_exists? 'projects'
  if Project.all.blank?
    ActiveRecord::Base.connection.execute 'ALTER SEQUENCE projects_id_seq RESTART WITH 1;'
    [{ name: 'project 1',description: 'project 1 description',user_id: 1}, { name: 'project 2',description: 'project 2 description',user_id: 1},{ name: 'project 3',description: 'project 3 description',user_id: 1}].each do |data|
      Project.find_or_create_by(data)        
    end  
  end 
end