FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}  
    password "foobar"
    password_confirmation "foobar"
  end

  factory :competition do
    name "Starcraft Competition"
    association :owner, factory: :user
  end

  factory :round do
    closing_time Time.now + 30.minutes
    competition
  end
end