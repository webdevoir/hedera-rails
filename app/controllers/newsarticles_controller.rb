class NewsarticlesController < ApplicationController
  def index
    @newsarticles = Newsarticle.all
  end

  def show
    @newsarticle = Newsarticle.find(params[:id])
  end
end
