module ApplicationHelper
  def skills_options
    options = Skill.all.map{|s| [s.keyword, s.keyword]}
    options
  end
end
