class HomeController < ApplicationController
  def index
    @newsarticles = Newsarticle.all.take(3)
  end
end
