require 'rails_helper'

RSpec.describe Group, type: :model do
  before :all do
    @user = User.new(name: 'Alex', email: 'generic@mail.com', password: '000000')
    @group = Group.new(id: 1, user: @user, name: 'Groceries', icon: 'https://www.restapp.com/wp-content/uploads/2021/12/grocery.png')
    @second_group = Group.new(id: 2, user: @user)
  end
  context 'Group Model Test' do
    it 'Invalid Group with missing input' do
      expect(@second_group).to be_invalid
    end
    it 'Valid Group' do
      expect(@group).to be_valid
    end
    it 'Valid group Saved' do
      expect(@group.name).to be == 'Groceries'
    end
  end
end
