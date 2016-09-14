# frozen_string_literal: true
RSpec.describe Newsletter, type: :model do
  subject { FactoryGirl.build(:newsletter) }

  it { should belong_to(:owner).class_name('User') }

  context 'with validation' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:name).is_at_most(255) }
    it { should allow_value('http://foo.com').for(:link) }
    it { should_not allow_value('http:foo.com').for(:link) }
  end
end
