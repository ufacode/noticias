# frozen_string_literal: true
FactoryGirl.define do
  factory :membership do
    user
    contact
  end
end
