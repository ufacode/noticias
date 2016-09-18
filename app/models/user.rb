# frozen_string_literal: true
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable

  has_many :newsletters

  validates :name, presence: true, length: { maximum: 255 }
end
