require 'rails_helper'

RSpec.describe Group, type: :model do
  @user1 = User.create(name: 'Danny')
  subject do
     Group.new(name: 'g1', icon: 'test.png', user_id: @user1)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'group should belong to user' do
    expect(subject.user_id).to eql(@user1)
  end

  it 'Test instance of group' do
    expect(subject).to be_instance_of Group
  end
end
