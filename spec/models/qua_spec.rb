require 'rails_helper'

RSpec.describe Qua, :type => :model do
  before do
    FactoryGirl.create(:qua)
  end
end
