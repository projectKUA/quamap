# -*- coding: utf-8 -*-
require 'spec_helper'
require 'rails_helper'
require 'capybara/rspec'

#RSpec.configure.include Capybara::DSL

RSpec.describe "Quas", :type => :feature do
  describe "GET /quas" do
    it "qua一覧表示画面が表示される" do
      visit quas_path
      expect(page).to have_content('Listing quas')
    end
  end
  describe "GET /quas.json" do
    it "qua一覧のjsonデータを取得する" do
      visit quas_path
      expect(page).to have_content('Listing quas')
    end
  end
  describe "GET /quas/1" do
    it "show.htmlテンプレートでquaレコードを1件表示する" do
      visit quas_path
      expect(page).to have_content('Listing quas')
    end
  end
end
