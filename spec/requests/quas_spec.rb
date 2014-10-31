# -*- coding: utf-8 -*-
require 'spec_helper'
require 'rails_helper'

RSpec.describe "Quas", :type => :request do
  describe "GET /quas" do
    it "正常にHTTPレスポンスコード200が返される。" do
      get quas_path
      expect(response.status).to be(200)
    end
  end
  describe "GET /quas.json" do
    it "正常にHTTPレスポンスコード200が返される。" do
      get "/quas.json"
      expect(response.status).to be(200)
    end
  end
  describe "GET /quas/1" do
    it "正常にHTTPレスポンスコード200が返される。" do
      get "/quas.json"
      expect(response.status).to be(200)
    end
  end
end
