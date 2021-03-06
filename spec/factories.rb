FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
    admin false
  end

  factory :projection do
    sequence(:name) { |n| "Projection#{n}" }
    description "Some description."
    category "Film"
    file File.open('Gemfile')
    user
  end
end
