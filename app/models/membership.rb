# frozen_string_literal: true
class Membership < ApplicationRecord
  belongs_to :subscriber, class_name: 'User'
  belongs_to :subscribed, class_name: 'User'

  validates :name, presence: true, length: { maximum: 255 }
  validates :subscribed_id, uniqueness: { scope: :subscriber_id }
end
