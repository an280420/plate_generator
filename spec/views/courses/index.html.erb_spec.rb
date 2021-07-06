require 'rails_helper'

RSpec.describe "courses/index", type: :view do
  before(:each) do
    assign(:courses, [
      Course.create!(
        name: "Name",
        level: "Level",
        volume: "Volume",
        template: nil,
        user: nil
      ),
      Course.create!(
        name: "Name",
        level: "Level",
        volume: "Volume",
        template: nil,
        user: nil
      )
    ])
  end

  it "renders a list of courses" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Level".to_s, count: 2
    assert_select "tr>td", text: "Volume".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
