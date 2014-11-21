# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe Qua, :type => :model do
  before do
    FactoryGirl.create(:qua1)
  end
  context "Qua#center" do
    before do
      @q = Qua.center
    end
    it "緯度経度が登録された温泉を一件取り出す" do
       expect(@q.latitude).to_not be_nil
       expect(@q.longitude).to_not be_nil 
    end
  end
end
