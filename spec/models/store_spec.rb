require 'rails_helper'

RSpec.describe Store, type: :model do
  before(:example) do
    @toma = User.create(name: 'toma', email: 'jane@doe.com', password: 'pw1234')
  end
  subject { Store.new(name: 'Food', icon: 'https://source.unsplash.com/random/100x100', user: @toma) }

  before { subject.save }

  it 'Name is required' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Name is valid' do
    subject.name = 'Food'
    expect(subject).to be_valid
  end

  it 'Icon is required' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'Icon is valid' do
    subject.icon = 'https://source.unsplash.com/random/100x100'
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

  it 'user value should be Int and Exist ' do
    subject.user_id = @toma.id
    expect(subject).to be_valid
  end

  it 'user value should not be String' do
    subject.user_id = '1'
    expect(subject).to_not be_valid
  end
end