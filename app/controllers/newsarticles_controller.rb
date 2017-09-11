class NewsarticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @newsarticles = Newsarticle.all.order("created_at DESC")
  end

  def show
    @newsarticle = Newsarticle.friendly.find(params[:id])
  end

  def new
    @newsarticle = Newsarticle.new
  end

  def create
    @newsarticle = Newsarticle.create(newsarticle_params)
    if @newsarticle.save
      redirect_to @newsarticle, notice: "Successfully created newsarticle."
    else
      flash[:alert] = @newsarticle.errors.full_messages.join(' ')
      render :new
    end
  end

  def edit
    @newsarticle = Newsarticle.friendly.find(params[:id])
  end

  def update
    @newsarticle = Newsarticle.friendly.find(params[:id])
    if @newsarticle.update(newsarticle_params)
      redirect_to @newsarticle, notice: "Successfully updated newsarticle."
    else
      flash[:alert] = @newsarticle.errors.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    @newsarticle = Newsarticle.friendly.find(params[:id])
    @newsarticle.destroy
    redirect_to newsarticles_path, notice: "Successfully deleted newsarticle."
  end

  private

  def newsarticle_params
    params.required(:newsarticle).permit(:title, :body, :location, :date, :link, :newsarticle_pic, :newsarticle_doc)
  end
end
