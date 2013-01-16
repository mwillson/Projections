FactoryGirl.define do
  factory :user do
    name     "Mark Willson"
    email    "mark@example.com"
    password "foobar"
    password_confirmation "foobar"
    admin false
  end
end
