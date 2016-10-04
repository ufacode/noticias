# frozen_string_literal: true
RSpec.describe User, type: :model do
  subject { FactoryGirl.build(:user) }

  let(:batman){ FactoryGirl.create(:user, name: 'Batman') }
  let(:catwoman){ FactoryGirl.create(:user, name: 'Catwoman') }
  let(:spiderman){ FactoryGirl.create(:user, name: 'spiderman') }

  context 'with validation' do
    it 'checks empty name' do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].count).to be_positive
    end

    it 'check length of name' do
      subject.name = 'Astrum' * 100
      subject.valid?
      expect(subject.errors[:name].count).to be_positive
    end

    it 'checks empty email' do
      subject.email = nil
      subject.valid?
      expect(subject.errors[:email].count).to be_positive
    end

    it 'checks uniqueness of email' do
      FactoryGirl.create(:user, name: subject.name, email: subject.email, password: subject.password)
      subject.valid?
      expect(subject.errors[:email].count).to be_positive
    end
  end

  context 'with associations' do
    it { expect(subject).to respond_to(:newsletters) }
    it { respond_to(:memberships) }
    it { respond_to(:ownerships) }
    it { respond_to(:subscribers) }
    it { respond_to(:subscribeds) }
  end

  context 'with memberships' do
    before do
      batman.ownerships.create!(subscribed: catwoman, name: catwoman.name)
      batman.ownerships.create!(subscribed: spiderman, name: spiderman.name)
    end

    it 'fetch right subscribeds' do
      expect(batman.subscribeds.count).to eq 2
      expect(batman.subscribeds).to include catwoman
      expect(batman.subscribeds).to include spiderman
    end

    it 'fetch right subscriber' do
      expect(catwoman.subscribers.first).to eq batman
      expect(spiderman.subscribers.first).to eq batman
    end
  end
end
