class User
  include Neo4j::ActiveNode

  property :email, type: String, constraint: :unique
  property :name, type: String

  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  validates :name, presence: true
end