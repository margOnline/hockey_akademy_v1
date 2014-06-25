#############################
###       PARENTS         ###
#############################
FactoryGirl.define do
  sequence(:email) { |n| "test#{n}@gmail.com" }

  factory :parent do
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

  factory :camp do
    association :location
    name        'Goalkeeping'
    description 'ipsem lorem'
    num_of_attendees 30
  end

  factory :campSession do
    association :camp
    title       'Penalties'
    description 'ipsem lorem de facto'
    start_time   Time.new(2014,7,11,10,0,0)
    end_time     Time.new(2014,7,11,16,0,0)
  end

  factory :coach do
    first_name 'Alex'
    last_name  'Ferguson'
    bio        'ipsem lorem blah di blah'
  end

  factory :location do
    name 'Brooklands'
  end

  factory :player do
    association           :standard
    association           :parent
    first_name            "Junior"
    last_name             "Doe"
    gender                "male"
    dob                   Time.current - 12.years
  end

  factory :standard do
    level 'beginner'
  end

end
