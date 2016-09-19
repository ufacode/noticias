# frozen_string_literal: true
RSpec.describe Contact, type: :model do
  subject { FactoryGirl.build(:contact) }

  it { should have_many(:memberships) }
  it { should have_many(:users).through(:memberships) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_length_of(:name).is_at_most(255) }
  it { should validate_length_of(:email).is_at_most(255) }
end
