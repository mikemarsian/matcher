class Search
  include ActiveModel::Model

  attr_accessor :skills

  def initialize(args = {})
    @skills = args[:skills] if args[:skills].present?
  end
end