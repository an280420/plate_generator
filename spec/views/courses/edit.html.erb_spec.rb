require 'rails_helper'

RSpec.describe "courses/edit", type: :view do
  before(:each) do
    @course = assign(:course, Course.create!(
      name: "MyString",
      level: "MyString",
      volume: "MyString",
      template: nil,
      user: nil
    ))
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(@course), "post" do

      assert_select "input[name=?]", "course[name]"

      assert_select "input[name=?]", "course[level]"

      assert_select "input[name=?]", "course[volume]"

      assert_select "input[name=?]", "course[template_id]"

      assert_select "input[name=?]", "course[user_id]"
    end
  end
end
