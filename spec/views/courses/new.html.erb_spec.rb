require 'rails_helper'

RSpec.describe "courses/new", type: :view do
  before(:each) do
    assign(:course, Course.new(
      name: "MyString",
      level: "MyString",
      volume: "MyString",
      template: nil,
      user: nil
    ))
  end

  it "renders new course form" do
    render

    assert_select "form[action=?][method=?]", courses_path, "post" do

      assert_select "input[name=?]", "course[name]"

      assert_select "input[name=?]", "course[level]"

      assert_select "input[name=?]", "course[volume]"

      assert_select "input[name=?]", "course[template_id]"

      assert_select "input[name=?]", "course[user_id]"
    end
  end
end
