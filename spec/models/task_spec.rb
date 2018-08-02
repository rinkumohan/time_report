require 'rails_helper'

RSpec.describe Task, type: :model do
  
  
  context 'validation tests' do
      it 'ensures name presence' do
        task = Task.new(description: 'abcdef',time_taken: 8.0,date: '2018-03-03',user_id: 1,project_id: 1).save
        expect(task).to eq(false)
      end
      
      it 'ensures time taken presence' do
        task = Task.new(name: 'abcd',description: 'abcdef',date: '2018-03-03',user_id: 1,project_id: 1).save
        expect(task).to eq(false)
      end
      
      it 'ensures date presence' do
        task = Task.new(name: 'abcd',description: 'abcdef',time_taken: 8.0,user_id: 1,project_id: 1).save
        expect(task).to eq(false)
      end
      
      it 'ensures project id presence' do
        task = Task.new(name: 'abcd',description: 'abcdef',time_taken: 8.0,user_id: 1,date: '2018-03-03').save
        expect(task).to eq(false)
      end
   
      it 'should save successfully' do
        task = Task.new(name: 'abcdef',user_id: 1,description: 'abcdef',time_taken: 8,project_id: 1,date: '2018-03-03').save
        expect(task).to eq(true)
      end
  end
 
end
