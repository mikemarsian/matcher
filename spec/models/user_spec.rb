require 'rails_helper'

RSpec.describe User do
  let(:user) { build(:user) }

  # describe "password validations" do
  #   context "on a new user" do
  #     it "should not be valid without a password" do
  #       user = User.new password: nil, password_confirmation: nil
  #       user.should_not be_valid
  #     end
  #
  #     it "should be not be valid with a short password" do
  #       user = User.new password: 'short', password_confirmation: 'short'
  #       user.should_not be_valid
  #     end
  #
  #     it "should not be valid with a confirmation mismatch" do
  #       user = User.new password: 'short', password_confirmation: 'long'
  #       user.should_not be_valid
  #     end
  #   end
  #
  #   context "on an existing user", focus:true do
  #     let(:user) do
  #       u = User.create(name: 'Joe', email: 'joe@gmail.com', password: 'password', password_confirmation: 'password')
  #       binding.pry
  #       User.find(u.id)
  #     end
  #
  #     it "should be valid with no changes" do
  #       user.should be_valid
  #     end
  #
  #     it "should not be valid with an empty password" do
  #       user.password = user.password_confirmation = ""
  #       user.should_not be_valid
  #     end
  #
  #     it "should be valid with a new (valid) password" do
  #       user.password = user.password_confirmation = "new password"
  #       user.should be_valid
  #     end
  #   end
  # end

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
