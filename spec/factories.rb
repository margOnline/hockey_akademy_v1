#############################
###       PARENTS         ###
#############################
FactoryGirl.define do
  sequence(:email) { |n| "test#{n}@gmail.com" }

  factory :parent do |f|
    first_name            "John"
    last_name             "Doe"
    email                 { FactoryGirl.generate(:email) }
    mobile_number         "0774123456"
    password              "password"
    password_confirmation "password"
  end

  #############################
  ###    EVERYTHING ELSE    ###
  ### ALPHABETIZE THIS LIST ###
  #############################

  factory :camp do |f|
    f.association :location
    f.name        'Goalkeeping'
    f.description 'ipsem lorem'
    f.num_of_attendees 30
  end

  factory :camp_registration do |f|
    f.association :player
    f.association :camp_session
    f.association :parent
  end

  factory :camp_registration_collection do |f|
    params = { :parent_id => 1, :camp_session_ids => 1 }
    f.params    params
    f.parent_id 1
  end

  factory :camp_session do |f|
    f.association :camp
    f.title       'Penalties'
    f.description 'ipsem lorem de facto'
    f.price        30.00
    f.start_time   Time.new(2014,7,11,10,0,0)
    f.end_time     Time.new(2014,7,11,16,0,0)
  end

  factory :charge do |f|
    f.association :parent
  end

  factory :coach do |f|
    f.first_name 'Alex'
    f.last_name  'Ferguson'
    f.bio        'ipsem lorem blah di blah'
  end

  factory :location do |f|
    f.name 'Brooklands'
  end

  factory :player do |f|
    f.association           :standard
    f.association           :parent
    f.first_name            "Junior"
    f.last_name             "Doe"
    f.gender                "male"
    f.dob                   Time.current - 12.years
  end

  factory :standard do |f|
    f.level 'beginner'
  end

end
