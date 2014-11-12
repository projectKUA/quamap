require 'rails_helper'

RSpec.describe "reviews/new", :type => :view do
  before(:each) do
    assign(:review, Review.new(
      :qua => nil,
      :total_score => 1,
      :quality_score => 1,
      :convinience_score => 1,
      :cost_score => 1,
      :sight_score => 1,
      :comment => "MyString",
      :photo_data => "",
      :photo_title => "MyString"
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input#review_qua_id[name=?]", "review[qua_id]"

      assert_select "input#review_total_score[name=?]", "review[total_score]"

      assert_select "input#review_quality_score[name=?]", "review[quality_score]"

      assert_select "input#review_convinience_score[name=?]", "review[convinience_score]"

      assert_select "input#review_cost_score[name=?]", "review[cost_score]"

      assert_select "input#review_sight_score[name=?]", "review[sight_score]"

      assert_select "input#review_comment[name=?]", "review[comment]"

      assert_select "input#review_photo_data[name=?]", "review[photo_data]"

      assert_select "input#review_photo_title[name=?]", "review[photo_title]"
    end
  end
end
