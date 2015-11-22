class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]


  # GET /workers
  def index
    @workers = Worker.all
  end

  # GET /workers/1
  def show
  end

  # GET /workers/new
  def new
    @worker = Worker.new
  end

  # GET /workers/1/edit
  def edit
  end

  # POST /workers
  def create
    @worker = Worker.new(worker_params)
    update_skills(worker_params)
    if @worker.save
      redirect_to @worker, notice: 'Worker was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /workers/1
  def update
    update_skills(worker_params)
    if @worker.update(worker_params)
      redirect_to @worker, notice: 'Worker was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /workers/1
  def destroy
    @worker.destroy
    redirect_to workers_url, notice: 'Worker was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      #eager load skills to avoid n+1 query problem
      @worker = Worker.where(uuid: params[:id]).with_associations(:skills).first
    end

    # Only allow a trusted parameter "white list" through.
    def worker_params
      params[:worker]
    end

    def update_skills(worker_params)
      keywords = worker_params.delete(:skills).try(:reject, &:blank?)
      if keywords.present?
        skills = Skill.where(keyword: keywords)
        # convert to set to ignore order of skills
        if skills.to_set != @worker.skills.to_set
          Rails.logger.info("Updating #{@worker.name}'s' skills")
          # TODO: should be refactored to only add/remove those skills that changed
          @worker.skills = skills
        end
      end
    end
end
