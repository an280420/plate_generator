require 'rails_helper'

RSpec.describe "courses/show", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      name: "Name",
      level: "Level",
      volume: "Volume",
      template: nil,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Level/)
    expect(rendered).to match(/Volume/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
