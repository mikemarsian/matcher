require 'rails_helper'

RSpec.describe Match do
  context 'invalid params' do
    it 'empty args' do
      workers = Match.call({})
      workers.should == []
    end
  end

  context 'valid params' do
    let(:workers) { create_list(:worker, 3) }
    let(:skills) { create_list(:skill, 3) }
    it 'find single worker with multiple skills' do
      workers.first.skills = skills

      found_workers = Match.call(skill_keywords: skills.map(&:keyword))

      found_workers.count.should == 1
      found_workers.first.should == workers.first
    end

    it 'multiple workers have skills, but only one has all the necessary skills' do
      workers.each {|w| w.skills << skills.first}
      workers.last.skills << skills.last

      found_workers = Match.call(skill_keywords: [skills.first, skills.last].map(&:keyword))

      found_workers.count.should == 1
      found_workers.first.should == workers.last
    end

    it 'no worker has all the skills' do
      workers.each {|w| w.skills << skills.first}

      found_workers = Match.call(skill_keywords: skills.map(&:keyword))

      found_workers.should == []
    end
  end
end