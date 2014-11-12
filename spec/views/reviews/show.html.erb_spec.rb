require 'rails_helper'

RSpec.describe "reviews/show", :type => :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :qua => nil,
      :total_score => 1,
      :quality_score => 2,
      :convinience_score => 3,
      :cost_score => 4,
      :sight_score => 5,
      :comment => "Comment",
      :photo_data => "",
      :photo_title => "Photo Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Comment/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Photo Title/)
  end
end
