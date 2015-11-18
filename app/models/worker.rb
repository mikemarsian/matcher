class Worker < User
  has_many :out, :skills, type: 'HAS_SKILLS', unique: true
end
