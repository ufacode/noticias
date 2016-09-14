# frozen_string_literal: true
FactoryGirl.define do
  factory :newsletter do
    name { Faker::Name.title }
    description { Faker::Lorem.paragraph(4) }
    link { Faker::Internet.url }
  end
end
