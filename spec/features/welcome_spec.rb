# -*- coding: utf-8 -*-                                                                                                                                         
require 'rails_helper'

RSpec.describe "WelcomePages", :type => :feature do
  describe "アプリケーションルートを表示する" do
    it "Qua Map welcomeページが表示される" do
      visit root_path
      expect(page).to have_content('Qua Map')
    end
  end
end
