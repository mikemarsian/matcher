require 'rails_helper'

RSpec.describe SearchController do
  let(:workers_with_skills) { create_list(:worker_with_skills, 3)}
  let(:skills) { workers_with_skills.first.skills }
  let(:exist_attributes) {
    {skills: skills.map(&:keyword)}
  }
  let(:non_exist_attributes) {
    {skills: create_list(:skill, 3).map(&:keyword)}
  }
  let(:invalid_attributes){
    {skills: ['doing kuku', 'enjoying foo']}
  }
  let(:valid_session) { {} }

  describe "GET #index" do
    context 'results should be found' do
      it "assigns all found workers as @found_workers" do
        get :index, {:search => exist_attributes}, valid_session
        expect(assigns(:found_workers)).to eq([workers_with_skills.first])
        expect(response).to render_template("index")
      end
    end

    context 'results should not be found' do
      it "when no worker has all the skills" do
        get :index, {:search => non_exist_attributes}, valid_session
        expect(assigns(:found_workers)).to be_blank
        expect(response).to render_template("index")
      end
      it "when given skills are invalid" do
        get :index, {:search => invalid_attributes}, valid_session
        expect(assigns(:found_workers)).to be_blank
        expect(response).to render_template("index")
      end
    end
  end
end