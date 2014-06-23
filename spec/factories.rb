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
    name        'Goalkeeping'
    description 'ipsem lorem'
  end

  factory :campSession do
    association :camp
    title       'Penalties'
    description 'ipsem lorem de facto'
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
