require 'rails_helper'

RSpec.describe Template, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context 'validations check' do
    # Проверяем наличие валидации
    it { should validate_presence_of :name }
  end
end
