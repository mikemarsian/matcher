class Worker < User
  has_many :out, :skills, type: 'HAS_SKILLS', unique: true

  def skills_string
    skill_keywords.join(', ')
  end

  def skill_keywords
    skills.map(&:keyword)
  end
end
