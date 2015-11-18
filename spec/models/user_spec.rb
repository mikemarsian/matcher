require 'rails_helper'

RSpec.describe User do
  let(:user) { build(:user) }

  context 'invalid params' do
    it 'has no email' do
      user.email = ''
      user.save
      user.should_not be_valid
    end

    it 'invalid email' do
      user.email = "invalid@invalid"
      user.save
      user.should_not be_valid
    end

    it 'duplicate email' do
      exist_user = create(:user, email: user.email, name: 'John')
      user.save
      user.should_not be_valid
    end

    it 'has no name' do
      user.name = ''
      user.save
      user.should_not be_valid
    end
  end

  context 'correct params' do
    let(:name) { user.name }
    let(:email) { user.email }
    it 'user is saved successfully' do
      user.save
      user.should be_valid
    end

    it 'user params are saved correctly' do
      user.save

      user.reload
      user.email.should == email
      user.name.should == name
    end
  end
end
