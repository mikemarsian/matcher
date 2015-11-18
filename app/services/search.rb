class Search
  def self.call(args = {})
    workers = []
    if args[:skills]
      skills = Skill.where(keyword: args[:skills]).to_a
      workers = Worker.all(:w).skills.match_to(skills).pluck('DISTINCT w')
    end
    workers.to_a
  end
end