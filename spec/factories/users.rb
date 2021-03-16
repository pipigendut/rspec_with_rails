FactoryBot.define do
  factory :user do
    firstname { Faker::Name.name }
    lastname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { 'pAssw0rd' }
  end
end