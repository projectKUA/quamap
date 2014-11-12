# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe Review, :type => :model do
  describe '.allは' do
    before do
      FactoryGirl.create(:review1)
    end
    context "Review.allでコールした場合" do
      before do
        @r = Review.all
      end
      it "レビューを全件取り出す" do
      end
    end
  end
end
