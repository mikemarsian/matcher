# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
begin
  shopping = Skill.create!(keyword: 'grocery shopping')
  singing = Skill.create!(keyword: 'singing in the rain')
  contemplating = Skill.create!(keyword: 'contemplating universe')
  joe = Worker.create!(name: 'Joe', email: 'joe@gmail.com')
  noa = Worker.create!(name: 'Noa', email: 'noa@gmail.com')
  joe.skills << shopping
  joe.skills << singing
  noa.skills << contemplating
  noa.skills << singing
rescue Neo4j::ActiveNode::Persistence::RecordInvalidError => exc
  puts "Error, you probably already ran rake db:seed. #{exc.message}"
end
