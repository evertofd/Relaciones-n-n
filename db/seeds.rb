# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
 projects = Project.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
 person = Person.create(name: "Everto")
 5.times do |i|
  p = Project.create(name: "proyecto #{i + 1}" )
  p.people << person
  p.save
 end


#   Character.create(name: 'Luke', movie: movies.first)
