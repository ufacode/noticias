# frozen_string_literal: true
class Newsletter < ApplicationRecord
  acts_as_paranoid

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  validates :name, :description, presence: true
  validates :name, length: { maximum: 255 }
  validates :link, format: { with: %r{\Ahttps?:\/\/+}, message: 'Invalid url format' },
                   allow_blank: true
end
