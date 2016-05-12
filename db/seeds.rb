# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

clark, tony, rick = User.create!([
   {name: 'Clark Kent', email: 'clark@email.com', password: 'ironhack', password_confirmation: 'ironhack'},
   {name: 'Tony Stark', email: 'tony@email.com', password: 'ironhack', password_confirmation: 'ironhack'},
   {name: 'Rick Grimes', email: 'rick@email.com', password: 'ironhack', password_confirmation: 'ironhack'},
 ])


 clark.opportunities.create!([{title: 'Watchmen', publisher: 'Vertigo'}, {title: 'The Walking Dead', publisher: 'Planeta'}])

 rick.opportunities.create!([{title: 'V for Vendetta', publisher: 'Vertigo'}, {title: '300', publisher: 'Norma'}])
