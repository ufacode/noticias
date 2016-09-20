# frozen_string_literal: true
RSpec.describe User, type: :model do
  subject { FactoryGirl.build(:user) }

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

  context 'association' do
    it 'responds to newsletters association' do
      expect(subject).to respond_to(:newsletters)
    end
  end
end
