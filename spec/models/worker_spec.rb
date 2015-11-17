require 'rails_helper'

RSpec.describe Worker do
  let(:worker) { build(:worker) }
  let(:skill) { create(:skill, keyword: 'singing in a shower')}
  context 'invalid params' do
  end

  context 'valid params' do
    it 'saved successfully' do
      worker.save
      worker.should be_valid
    end

    it 'fields and associations are saved correctly' do
      binding.pry
      worker.skills << skill
      worker.save

      worker.reload
      worker.skills.count.should == 4
      worker.skills.map(&:keyword).should include('singing in a shower')
    end
  end
end
