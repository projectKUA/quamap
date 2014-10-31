# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe "WelcomePages", :type => :request do
  describe "アプリケーションルートにアクセス" do
    it "コード200 OKを返す" do
      get root_path
      expect(response).to be_success
      expect(response.status).to be(200)
    end
  end
end
