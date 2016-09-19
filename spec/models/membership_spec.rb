# frozen_string_literal: true
RSpec.describe Membership, type: :model do
  subject { FactoryGirl.build(:membership) }

  it { should belong_to(:user) }
  it { should belong_to(:contact) }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(255) }
  it do
    should validate_uniqueness_of(:contact_id).scoped_to(:user_id)
      .with_message('has already been added')
  end
end
