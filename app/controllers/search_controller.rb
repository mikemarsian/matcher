class SearchController < ApplicationController

  def index
    @search = Search.new(search_params)
    @found_workers = []
    if search_params
      @found_workers = Match.call(skill_keywords: search_params[:skills])
    end
  end

  private

  def search_params
    search_params = params[:search].present? ? params[:search] : {skills: []}
    search_params
  end
end