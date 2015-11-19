class Match
  def self.call(args = {})
    workers = []
    if args[:skill_keywords]
      skills = Skill.where(keyword: args[:skill_keywords]).to_a
      result = Worker.all(:w).skills(:s).match_to(skills).pluck('DISTINCT w, count(s)')
      #return workers who have all the skills, not just some skills
      workers = result.select{|i| i[1] == skills.count}.map{|i| i[0]}
    end
    workers.to_a
  end

end