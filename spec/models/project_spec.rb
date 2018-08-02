require 'rails_helper'

RSpec.describe Project, type: :model do
  
    context 'validation tests' do
      it 'ensures name presence' do
        proj = Project.new(description: 'abcdef').save
        expect(proj).to eq(false)
      end
      
      it 'ensures user_id presence' do
        proj = Project.new(name: 'abcdef',description: 'abcdef').save
        expect(proj).to eq(false)
      end
   
      it 'should save successfully' do
        proj = Project.new(name: 'abcdef',user_id: 1,description: 'abcdef').save
        expect(proj).to eq(true)
      end
   
   end

end
