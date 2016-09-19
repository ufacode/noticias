# frozen_string_literal: true
class Contact < ApplicationRecord
  self.table_name = 'users'

  has_many :memberships
  has_many :users, through: :memberships

  validates :name, :email, presence: true, length: { maximum: 255 }

  delegate :name, to: :memberships
end
