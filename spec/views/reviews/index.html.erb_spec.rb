require 'rails_helper'

RSpec.describe "reviews/index", :type => :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        :qua => nil,
        :total_score => 1,
        :quality_score => 2,
        :convinience_score => 3,
        :cost_score => 4,
        :sight_score => 5,
        :comment => "Comment",
        :photo_title => "Photo Title",
        :title => "",
        :nickname => "",
        :email => ""
       ),
      Review.create!(
        :qua => nil,
        :total_score => 1,
        :quality_score => 2,
        :convinience_score => 3,
        :cost_score => 4,
        :sight_score => 5,
        :comment => "Comment",
        :photo_title => "Photo Title",
        :title => "",
        :nickname => "",
        :email => ""
       )
    ])
  end

  it "renders a list of reviews" do
    render
    # assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
    # assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Photo Title".to_s, :count => 2
  end
end
