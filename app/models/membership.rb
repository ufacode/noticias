# frozen_string_literal: true
class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :contact
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :contact_id, uniqueness: { scope: :user_id,
                                       message: 'has already been added' }
end
