require 'rails_helper'

RSpec.describe User, type: :request do
  context 'User Test' do
    it 'Valid user' do
      user = User.new(name: 'Alex', email: 'generic@mail.com', password: '000000')
      expect(user).to be_valid
    end
    it 'Invalid User with missing input' do
      user = User.new(name: '', email: 'generic@mail.com', password: '000000')
      expect(user).to be_invalid
    end
  end
end
