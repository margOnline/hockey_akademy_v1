FactoryGirl.define do
  factory :user do
    firstname             "Michael"
    lastname              "Hartl"
    email                 "michael@gmail.com"
    password              "password"
    password_confirmation "password"
  end

end