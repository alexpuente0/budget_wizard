require 'rails_helper'

RSpec.describe Expense, type: :model do
  before :all do
    @user = User.new(name: 'Alex', email: 'generic@mail.com', password: '000000')
    @group = Group.new(id: 1, user: @user, name: 'Groceries', icon: 'https://www.restapp.com/wp-content/uploads/2021/12/grocery.png')
  end

  context 'Expense Test' do
    it 'Valid entrie' do
      expense = Expense.new(user: @user, group: @group, name: 'Cheese Board', amount: 80)
      expect(expense).to be_valid
    end
    it 'Invalid entrie with missing input' do
      expense = Expense.new(group: @group, name: 'Cheese Board', amount: 80)
      expect(expense).to be_invalid
    end
  end
end
