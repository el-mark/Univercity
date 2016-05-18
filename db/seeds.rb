# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


teamlabs, the_creativity_workshop, ironhack, marketing_school, business_institute = User.create!([
   {name: 'Teamlabs', email: 'teamlabs@g.com', password: 'teamlabs', password_confirmation: 'teamlabs'},
   {name: 'The Creativity Workshop', email: 'the@g.com', password: 'thecreativity', password_confirmation: 'thecreativity'},
   {name: 'Ironhack', email: 'ironhack@g.com', password: 'ironhack', password_confirmation: 'ironhack'},
   {name: 'Marketing School', email: 'marketing@g.com', password: 'marketing', password_confirmation: 'marketing'},
   {name: 'Business Institute', email: 'business@g.com', password: 'business', password_confirmation: 'business'},
   {name: 'Marcos', email: 'marcos@g.com', password: 'marcos', password_confirmation: 'marcos', role: 'Curator'},
])

t1 = Tag.create!(name:'Marketing')
t2 = Tag.create!(name:'Business')
t3 = Tag.create!(name:'Tecnology')

op1 = ironhack.opportunities.create!(title:'Web Development Bootcamp', description:'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.', opportunity_type:'Course', startdate: DateTime.new(2016,6,13), duration:'8 weeks', location:'Carrer pamplona 96, Barcelona', published:true)
op2 = teamlabs.opportunities.create(title:'High Impact Entrepreneurship', description:'Tempor incididunt ut labore et dolore magna aliqua.', opportunity_type:'Workshop', startdate:DateTime.new(2016,6,7), duration:'2 days', location:'Carrer Bailén 11, Barcelona', published:true)
op3 = teamlabs.opportunities.create(title:'Digital Marketing at Teamlabs', description:'Ut enim ad minim veniam, quis nostrud exercitation ullamco.', opportunity_type:'Workshop', startdate:DateTime.new(2016,7,25), duration:'2 days', location:'Carrer Bailén 11, Barcelona', published:true)
op4 = the_creativity_workshop.opportunities.create(title:'Planing to create', description:'Laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit.', opportunity_type:'Event', startdate:DateTime.new(2016,6,18), duration:'1 day', location:'Carrer Badal 182, Barcelona', published:true)
op5 = the_creativity_workshop.opportunities.create(title:'Creating a brand', description:'In voluptate velit esse cillum dolore eu fugiat nulla pariatur.', opportunity_type:'Course', startdate:DateTime.new(2016,7,4), duration:'3 week', location:'Carrer Badal 182, Barcelona', published:true)
op6 = the_creativity_workshop.opportunities.create(title:'Marketing and innovation', description:'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', opportunity_type:'Workshop', startdate:DateTime.new(2016,6,25), duration:'2 days', location:'La Rambla 73, Barcelona', published:true)
op7 = marketing_school.opportunities.create(title:'Digital Marketing', description:'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', opportunity_type:'Workshop', startdate:DateTime.new(2016,7,24), duration:'2 days', location:'La Rambla 73, Barcelona', published:true)
op8 = marketing_school.opportunities.create(title:'Neuro Marketing', description:'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', opportunity_type:'Event', startdate:DateTime.new(2016,6,9), duration:'1 day', location:'La Rambla 73, Barcelona', published:true)
op9 = business_institute.opportunities.create(title:'Finance for small companies', description:'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', opportunity_type:'Course', startdate:DateTime.new(2016,7,11), duration:'3 weeks', location:'Carrer Espanya 51, Barcelona', published:true)
op10 = business_institute.opportunities.create(title:'Talent manage for small companies', description:'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', opportunity_type:'Course', startdate:DateTime.new(2016,6,12), duration:'7 weeks', location:'Carrer Espanya 51, Barcelona', published:true)

op1.tags.push(t3)
op2.tags.push(t1,t2)
op3.tags.push(t1,t2,t3)
op4.tags.push(t1,t2)
op5.tags.push(t3)
op6.tags.push(t1)
op7.tags.push(t2)
op8.tags.push(t1,t2,t3)
op9.tags.push(t2)
op10.tags.push(t1,t2,t3)
