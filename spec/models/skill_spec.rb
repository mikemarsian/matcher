require 'rails_helper'

RSpec.describe Skill do
  let(:skill) { build(:skill) }
  context 'invalid params' do
    it 'no keyword' do
      skill.keyword = ''
      skill.save

      skill.should_not be_valid
    end

    it 'has too short keyword' do
      skill.keyword = 'q'
      skill.save

      skill.should_not be_valid
    end

    it 'has too long keyword' do
      skill.keyword = 'q'*50
      skill.save

      skill.should_not be_valid
    end

    it 'duplicate keyword' do
      exist_skill = create(:skill)
      skill.keyword = exist_skill.keyword
      skill.save

      skill.should_not be_valid
    end
  end

  context 'valid params' do
    it 'saved successfully' do
      skill.save
      skill.should be_valid
    end

    it 'fields are saved correctly' do
      keyword = skill.keyword
      skill.save

      skill.reload
      skill.keyword.should == keyword
    end
  end
end
