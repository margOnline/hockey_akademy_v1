#############################
###       PARENTS         ###
#############################
FactoryGirl.define do
  factory :parent do
    first_name            "John"
    last_name             "Doe"
    email                 "john@gmail.com"
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

  factory :location do
    name 'Brooklands'
  end

  factory :standard do
    level 'Cub'
  end


end
