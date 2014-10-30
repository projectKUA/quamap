require 'rails_helper'

RSpec.describe "StaticPages", :type => :request do
  describe "GET /" do
    it "" do
      get '/'
      expect(response.status).to be(200)
    end
  end
end
