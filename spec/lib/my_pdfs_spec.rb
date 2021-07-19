require 'rails_helper'

RSpec.describe "lib/my_pdf", type: :model do
  
  #Тесты методов класса
  context 'all methods class' do
    let(:user) { FactoryBot.create(:user) }
    let(:template) { Template.create(name: 'Template №1', body: '***{{course.name}}***level: {{course.level}}***volume: {{course.volume}}***user: {{user.name}}') }
    let(:course) { Course.create(name: 'Ruby', level: 'Hard', volume: '100 hours', user_id: user.id, template_id: template.id) }
    let(:my_pdf) { MyPdf.new(course.id) }

    it 'return correct path pdf file' do
      expect(my_pdf.pdf_path.class).to eq(Pathname)
      expect(my_pdf.pdf_path).to eq(Rails.root + 'pdfs/Ruby_program.pdf')
    end

    it 'return template with liqid objects' do
      expect(my_pdf.create_template).to eq('***Ruby***level: Hard***volume: 100 hours***user: Вася')
    end

    it 'create and save pdf' do
      pdf = my_pdf.create_pdf
      expect(pdf.class).to eq(File)
    end
  end
end
