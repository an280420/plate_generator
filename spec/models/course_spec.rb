require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course) { FactoryBot.create(:course) }

  it 'return name course' do
    expect(course.name.split("№")[0]).to eq('Курс ')
    expect(course.name.split("№")[1].to_i).to be_between(0, 999)
  end

  it 'return level course' do
    expect(%w(soft medium hard)).to include(course.level) 
  end

  it 'return volume course' do
    expect(course.volume.split(" ")[0].to_i).to be_between(0, 999)
    expect(course.volume.split(" ")[1]).to eq('hours')
  end
end
