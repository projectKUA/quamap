class WelcomeController < ApplicationController
  def index
    @quas = Qua.all
  end
end
