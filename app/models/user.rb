# frozen_string_literal: true
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :newsletters
  has_many :ownerships, class_name: 'Membership', foreign_key: :subscriber_id
  has_many :memberships, foreign_key: :subscribed_id

  has_many :subscribers, class_name: 'User', through: :memberships, foreign_key: :subscriber_id, dependent: :destroy
  has_many :subscribeds, class_name: 'User', through: :ownerships, foreign_key: :subscribed_id, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
end
