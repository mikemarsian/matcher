class Skill
  include Neo4j::ActiveNode

  property :keyword, type: String, index: :exact

  has_many :in, :workers, type: 'HAS_SKILLS', unique: true

  validates :keyword, presence: true, length: { minimum: 2, maximum: 30 }
end
