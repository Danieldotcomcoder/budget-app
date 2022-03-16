require 'rails_helper'

RSpec.describe Payment, type: :model do
  @user1 = User.create(name: 'Danny')
  @group1 = Group.create(name: 'g2', icon: 'test.png', user_id: @user1)
  subject do
     Payment.new(name: 'food-payment', amount: 50.0, user_id: @user1, group_id: @group1)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be less than 50 chars' do
    subject.name = 'hagdlihaygvdjashvgdajksyhdgvaiyhsgvdaisyhgvd;adadvkahda'
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be positive' do
    subject.amount = -5
    expect(subject).to_not be_valid
  end
  
  it 'amount should be decimal' do
    expect(subject.amount).to be_kind_of Numeric
  end

   it 'payment should belong to user' do
     expect(subject.user_id).to eql(@user1)
   end

  it 'payment should belong to group' do
    expect(subject.group_id).to eql(@group1)
  end
end
