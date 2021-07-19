require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it 'return name user' do
    expect(user.name).to eq('Вася') 
  end
end
