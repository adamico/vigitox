class HomeController < ApplicationController
  def index
    @last = Revue.derniere
  end
end
