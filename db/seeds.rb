# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Alpha Bet", email: "abc@users.com", password: "123", admin: true)

names = 10.times.map {"#{Faker::Name.unique.first_name} #{Faker::Name.last_name}"}

emails = 10.times.map.with_index {|n, i| Faker::Internet.free_email(name: names[i])}

passwords = 10.times.map {"123"}

user_params_array = names.map.with_index {|name, i| Hash.new.tap {|hash| hash[:name] = name; hash[:email] = emails[i]; hash[:password] = passwords[i]}}

user_params_array.each {|user_params| User.create(user_params)}

Event.create(
  title: "Good Friday Service", 
  date: "2021-04-02", 
  time: "19:30", 
  onsite: true, 
  description: "We have been awaiting this day for a long time (a year to be exact)!", 
  spots: 5
)

Event.create(
  title: "Easter Sunday Worship Service (AM)", 
  date: "2021-04-04", 
  time: "10:30", 
  onsite: true, 
  description: "He's risen! He's risen indeed!!! Jesus Christ is our resurrected Lord and Savior who died for the sinners like me.", 
  spots: 5
)

Event.create(
  title: "Easter Sunday Worship Service (PM)", 
  date: "2021-04-04", 
  time: "12:30", 
  onsite: true, 
  description: "He's risen! He's risen indeed!!! Jesus Christ is our resurrected Lord and Savior who died for the sinners like me.", 
  spots: 5
)

Event.create(
  title: "Tuesday Community Group", 
  date: "2021-04-06", 
  time: "19:30", 
  description: "Our communities keep on going! Lots of fun and meaningful conversation.", 
  spots: 3
)

Event.create(
  title: "Wednesday Community Group", 
  date: "2021-04-07", 
  time: "19:30", 
  description: "Our communities keep on going! Lots of fun and meaningful conversation.", 
  spots: 3
)

Event.create(
  title: "Thursday Community Group", 
  date: "2021-04-08", 
  time: "19:30", 
  description: "Our communities keep on going! Lots of fun and meaningful conversation.", 
  spots: 3
)

Event.create(
  title: "Worship Practice", 
  date: "2021-04-10", 
  time: "11:00", 
  onsite: true, 
  description: "We need some volunteers for sound engineering. Don't require any specialties. Just come and help us!", 
  spots: 2
)

Event.create(
  title: "New Year's Day Celebration", 
  date: "2025-01-01", 
  time: "11:00", 
  onsite: true, 
  description: "Let's welcome together the coming new year!!!", 
  spots: 100
)

Event.create(
  title: "Easter Sunday Worship Service (AM)", 
  date: "2025-01-05", 
  time: "10:30", 
  onsite: true, 
  description: "We worship together because He's risen! And He gave us life and rest.", 
  spots: 150
)


Registration.create(event_id: 1, user_id: 1)
Registration.create(event_id: 1, user_id: 2)
Registration.create(event_id: 1, user_id: 3)
Registration.create(event_id: 1, user_id: 4)
Registration.create(event_id: 1, user_id: 5)

Registration.create(event_id: 2, user_id: 1)
Registration.create(event_id: 2, user_id: 6)
Registration.create(event_id: 2, user_id: 7, family: true)
Registration.create(event_id: 2, user_id: 8)
Registration.create(event_id: 2, user_id: 9)

Registration.create(event_id: 3, user_id: 1)
Registration.create(event_id: 3, user_id: 10, family: true)
Registration.create(event_id: 3, user_id: 11)

Registration.create(event_id: 4, user_id: 2)

Registration.create(event_id: 5, user_id: 3)
Registration.create(event_id: 5, user_id: 6)

Registration.create(event_id: 6, user_id: 4)
Registration.create(event_id: 6, user_id: 7)
Registration.create(event_id: 6, user_id: 8)

Registration.create(event_id: 7, user_id: 5)
