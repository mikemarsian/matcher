class Match
  def self.call(args = {})
    workers = []
    if args[:skill_keywords]
      keywords = args[:skill_keywords].reject(&:blank?)
      Rails.logger.info("Match: looking for workers with the following skills: #{keywords.join(',')}")
      skills = Skill.where(keyword: args[:skill_keywords]).to_a
      result = Worker.all(:w).skills(:s).match_to(skills).pluck('DISTINCT w, count(s)')
      #return workers who have all the skills, not just some skills
      workers = result.select{|i| i[1] == skills.count}.map{|i| i[0]}
    end
    workers.to_a
  end

end