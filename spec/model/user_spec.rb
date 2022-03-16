require 'rails_helper'

RSpec.describe Group, type: :model do
  
  subject do
    @user1 = User.new(name: 'Danny')
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

end
