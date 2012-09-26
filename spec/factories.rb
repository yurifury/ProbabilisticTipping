FactoryGirl.define do
  factory :user do
    name     "Yuri Feldman"
    email    "yuri@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end