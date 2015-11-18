require 'rails_helper'

RSpec.describe Worker do
  let(:worker) { create(:worker) }
  let(:skill) { create(:skill, keyword: 'singing in a shower')}
  context 'invalid params' do
    it 'should not allow adding existing skill to worker' do
      count = worker.skills.count
      worker.skills << skill
      worker.skills << skill
      worker.skills.count.should == count + 1
    end
  end

  context 'valid params' do
    it 'saved successfully' do
      worker.save
      worker.should be_valid
    end

    it 'fields and associations are saved correctly' do
      skills_count = worker.skills.count
      worker.skills << skill

      worker.reload
      worker.skills.count.should == skills_count + 1
      worker.skills.map(&:keyword).should include('singing in a shower')
    end
  end
end
