class HomeController < ApplicationController
  def index
    @last = Revue.derniere
  end
  def disclaimer
  end
end
