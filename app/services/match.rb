class Match
  def self.call(args = {})
    workers = []
    if args[:skill_keywords]
      keywords = args[:skill_keywords].reject(&:blank?)
      Rails.logger.info("Match: looking for workers with the following skills: #{keywords.join(',')}")
      skills = Skill.where(keyword: args[:skill_keywords]).to_a

      result = Worker.all(:w).skills(:s).match_to(skills).pluck('DISTINCT w, count(s)')
      # This generates the following Cypher:
      # MATCH (w:'Worker':'User') MATCH w-[rel1:'HAS_SKILLS']->(s:'Skill') WHERE (ID(s) IN {ID_s}) RETURN DISTINCT w, count(s) | {:ID_s=>[14563, 14600, 14605]}

      # group by count
      workers_by_skills = result.group_by{|r| r[1] }
      #return workers who have all the skills, not just some skills
      if workers_by_skills[skills.count].present?
        workers = workers_by_skills[skills.count].map{|i| i[0]}
      end
    end
    workers.to_a
  end

end