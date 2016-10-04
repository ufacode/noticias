# frozen_string_literal: true
RSpec.describe Membership, type: :model do
  subject { FactoryGirl.build(:membership) }

  let(:batman){ FactoryGirl.create(:user, name: 'Batman') }
  let(:catwoman){ FactoryGirl.create(:user, name: 'Catwoman') }
  let(:spiderman){ FactoryGirl.create(:user, name: 'spiderman') }

  context 'with relations' do
    it { should belong_to(:subscriber) }
    it { should belong_to(:subscribed) }
  end

  context 'with validations' do
    before do
      subject.subscriber = batman
      subject.subscribed = catwoman
      subject.save
    end

    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(255) }

    it 'subscribed user should be uniq for subscriber' do
      should validate_uniqueness_of(:subscribed_id).scoped_to(:subscriber_id)
    end
  end

  context 'with membership subscriptions' do
    before do
      subject.subscriber = batman
      subject.subscribed = catwoman
      subject.save
    end

    it 'subscribe 1 person' do
      expect(Membership.count).to eq 1
    end

    it 'subscribe 2 people' do
      meme = FactoryGirl.build(:membership)
      meme.subscriber = batman
      meme.subscribed = spiderman
      meme.save

      expect(Membership.count).to eq 2
    end
  end
end
