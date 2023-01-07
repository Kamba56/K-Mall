require 'rails_helper'

RSpec.describe Item, type: :model do
  before(:example) do
    @toma = User.create(name: 'toma', email: 'jane@doe.com', password: 'pw1234')
  end
  subject { Item.new(name: 'MacDonald Nugget', amount: 100, user_id: @toma.id) }

  before { subject.save }

  it 'Name is required' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name is Valid' do
    subject.name = 'MacDonald Nugget'
    expect(subject).to be_valid
  end

  it 'Amount is required' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'Amount should not be String' do
    subject.amount = 'aaa'
    expect(subject).to_not be_valid
  end

  it 'Amount should be Int' do
    subject.amount = 50
    expect(subject).to be_valid
  end

  it 'user is required' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'user should exist' do
    subject.user_id = 10
    expect(subject).to_not be_valid
  end

  it 'user value should be Int and Exist' do
    subject.user_id = @toma.id
    expect(subject).to be_valid
  end

  it 'user value should not be String' do
    subject.user_id = '1'
    expect(subject).to_not be_valid
  end
end