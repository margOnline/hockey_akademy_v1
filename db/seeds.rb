# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.development?
  description = "Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor
  sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies
  mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien
  ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae,
  ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros
  ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis
  pulvinar facilisis."

  bio = "Pellentesque habitant morbi tristique senectus et netus et malesuada
  fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget,
  tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean
  ultricies mi vitae est. Mauris placerat eleifend leo."

  standard1 = Standard.create(:level => "Club")
  standard2 = Standard.create(:level => "Bear")
  standard3 = Standard.create(:level => "Beginner")
  standard4 = Standard.create(:level => "International")
  standard5 = Standard.create(:level => "County")

  location1 = Location.create(:name => "Brooklands")
  location2 = Location.create(:name => "Old Trafford")
  camp1 = Camp.create(:name => "Goal Keeping", :description => description, :location_id => location1.id, :num_of_attendees => 30)
  camp2 = Camp.create(:name => "Offense", :description => description, :location_id => location1.id, :num_of_attendees => 50)
  camp3 = Camp.create(:name => "Defense", :description => description, :location_id => location1.id, :num_of_attendees => 30)
  camp4 = Camp.create(:name => "Pre Season Training", :description => description, :location_id => location2.id, :num_of_attendees => 40)
  camp5 = Camp.create(:name => "Match Play", :description => description, :location_id => location2.id, :num_of_attendees => 25)

  Coach.create([
    {:first_name => "Alex", :last_name => "Ferguson", :bio => bio, :gravatar => ""},
    {:first_name => "Jose", :last_name => "Mourinho", :bio => bio, :gravatar => ""},
    {:first_name => "Roy", :last_name => "Hodgeson", :bio => bio, :gravatar => ""}
    ])

  parent1 = Parent.create(:first_name => "John", :last_name => "Doe",
    :email => "John@gmail.com", :password => 'password',
    :password_confirmation => 'password', :mobile_number => '0779123123')

  Player.create([
    {:first_name => "Patrick", :last_name => "Doe", :dob => Time.new(2000,04,18), :club => "Surrey",
      :standard_id => standard1.id, :medical => "", :allergies => "", :parent_id => parent1.id},
    {:first_name => "Jennifer", :last_name => "Doe", :dob => Time.new(2002,07,26), :club => "Surrey",
      :standard_id => standard2.id, :medical => "asthma", :allergies => "", :parent_id => parent1.id},
    {:first_name => "Christopher", :last_name => "Doe", :dob => Time.new(1998,10,06), :club => "Surrey",
      :standard_id => standard3.id, :medical => "", :allergies => "allergic to nuts", :parent_id => parent1.id}
    ])
end
