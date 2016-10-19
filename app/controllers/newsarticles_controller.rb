class NewsarticlesController < ApplicationController
  def index
    @newsarticles = Newsarticle.all
  end
end
