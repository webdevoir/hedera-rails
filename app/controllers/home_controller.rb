class HomeController < ApplicationController
  def index
    @newsarticles = Newsarticle.all.order("created_at DESC").take(3)
  end
end
