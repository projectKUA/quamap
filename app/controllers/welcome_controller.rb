class WelcomeController < ApplicationController
  def index
    @quas = Qua.all
    @center = Qua.center
  end
end
