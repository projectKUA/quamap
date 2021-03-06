require 'rails_helper'

RSpec.describe "reviews/edit", :type => :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :qua => nil,
      :total_score => 1,
      :quality_score => 1,
      :convinience_score => 1,
      :cost_score => 1,
      :sight_score => 1,
      :comment => "MyString",
      :photo_title => "MyString",
      :title => "",
      :nickname => "",
      :email => ""
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input#review_qua_id[name=?]", "review[qua_id]"

      assert_select "input#review_total_score[name=?]", "review[total_score]"

      assert_select "input#review_quality_score[name=?]", "review[quality_score]"

      assert_select "input#review_convinience_score[name=?]", "review[convinience_score]"

      assert_select "input#review_cost_score[name=?]", "review[cost_score]"

      assert_select "input#review_sight_score[name=?]", "review[sight_score]"

      assert_select "input#review_comment[name=?]", "review[comment]"

      assert_select "input#review_photo_title[name=?]", "review[photo_title]"

      assert_select "input#review_title[name=?]", "review[title]"

      assert_select "input#review_nickname[name=?]", "review[nickname]"

      assert_select "input#review_email[name=?]", "review[email]"
    end
  end
end
