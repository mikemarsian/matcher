require 'rails_helper'

RSpec.describe WorkersController do

  let(:valid_attributes) {
    {email: 'joe@joe.com', name: 'mike'}
  }

  let(:invalid_attributes) {
    {name: 'joe', email: 'joe'}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all workers as @workers" do
      worker = Worker.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:workers)).to eq([worker])
    end
  end

  describe "GET #show" do
    it "assigns the requested worker as @worker" do
      worker = Worker.create! valid_attributes
      get :show, {:id => worker.to_param}, valid_session
      expect(assigns(:worker)).to eq(worker)
    end
  end

  describe "GET #new" do
    it "assigns a new worker as @worker" do
      get :new, {}, valid_session
      expect(assigns(:worker)).to be_a_new(Worker)
    end
  end

  describe "GET #edit" do
    it "assigns the requested worker as @worker" do
      worker = Worker.create! valid_attributes
      get :edit, {:id => worker.to_param}, valid_session
      expect(assigns(:worker)).to eq(worker)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Worker" do
        expect {
          post :create, {:worker => valid_attributes}, valid_session
        }.to change(Worker, :count).by(1)
      end

      it "assigns a newly created worker as @worker" do
        post :create, {:worker => valid_attributes}, valid_session
        expect(assigns(:worker)).to be_a(Worker)
        expect(assigns(:worker)).to be_persisted
      end

      it "redirects to the created worker" do
        post :create, {:worker => valid_attributes}, valid_session
        expect(response).to redirect_to(Worker.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved worker as @worker" do
        post :create, {:worker => invalid_attributes}, valid_session
        expect(assigns(:worker)).to be_a_new(Worker)
      end

      it "re-renders the 'new' template" do
        post :create, {:worker => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:skills) { create_list(:skill, 3) }
      let(:new_attributes) {
        {email: 'superjoe@joe.com', skills: skills.map(&:keyword) }
      }
      it "updates the requested worker" do
        worker = Worker.create! valid_attributes
        put :update, {:id => worker.to_param, :worker => new_attributes}, valid_session
        worker.reload
        expect(worker.email).to eq(new_attributes[:email])
        expect(worker.skills.map(&:keyword).to_set).to eq(new_attributes[:skills].to_set)
      end

      it "assigns the requested worker as @worker" do
        worker = Worker.create! valid_attributes
        put :update, {:id => worker.to_param, :worker => valid_attributes}, valid_session
        expect(assigns(:worker)).to eq(worker)
      end

      it "redirects to the worker" do
        worker = Worker.create! valid_attributes
        put :update, {:id => worker.to_param, :worker => valid_attributes}, valid_session
        expect(response).to redirect_to(worker)
      end
    end

    context "with invalid params" do
      it "assigns the worker as @worker" do
        worker = Worker.create! valid_attributes
        put :update, {:id => worker.to_param, :worker => invalid_attributes}, valid_session
        expect(assigns(:worker)).to eq(worker)
      end

      it "re-renders the 'edit' template" do
        worker = Worker.create! valid_attributes
        put :update, {:id => worker.to_param, :worker => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested worker" do
      worker = Worker.create! valid_attributes
      expect {
        delete :destroy, {:id => worker.to_param}, valid_session
      }.to change(Worker, :count).by(-1)
    end

    it "redirects to the workers list" do
      worker = Worker.create! valid_attributes
      delete :destroy, {:id => worker.to_param}, valid_session
      expect(response).to redirect_to(workers_url)
    end
  end
end
