FactoryGirl.define do
  factory :user do
    first_name "Mike"
    last_name "Matthews"
    description "I love long walks on the beach."
    email "somemail@some.com"
    password "pass1234"
    gender 'male'
    votes 0

    trait :spanish do
      first_name "Juan"
      last_name "Dominguez"
      description "Te Amo mi amor"
      email "anymail1@any.com"
      password "Password1"
      gender 'male'
      votes 2
    end

    trait :english do
      first_name "Henry"
      last_name "Scott"
      description "Te Amo mi amor"
      email "anymail2@any.com"
      password "Password2"
      gender 'male'
      votes 0
    end

  end

end
