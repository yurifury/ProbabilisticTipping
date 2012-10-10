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
    competitor_set
  end

  factory :round do
    closing_time Time.now + 30.minutes
    competition
  end

  factory :match do
    round
    association :competitor_1, factory: :competitor_a
    association :competitor_2, factory: :competitor_b
  end

  factory :competitor_set do
    sequence(:name) {|n| "Competitor_set #{n}"}
    association :owner, factory: :user
    competitors {[FactoryGirl.create(:competitor_a), FactoryGirl.create(:competitor_b)]}
  end

  factory :competitor do
    sequence(:name) {|n| "Competitor #{n}"}

    trait :a do
      sequence(:name) {|n| "Competitor A #{n}"}
    end

    trait :b do
      sequence(:name) {|n| "Competitor B #{n}"}
    end

    factory :competitor_a, traits: [:a]
    factory :competitor_b, traits: [:b]
  end
end