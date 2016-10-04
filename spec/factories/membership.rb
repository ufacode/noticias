# frozen_string_literal: true
FactoryGirl.define do
  factory :membership do
    name { Faker::Name.name }
  end
end
