class NewsarticlesController < ApplicationController
  def index
    @newsarticles = Newsarticle.all
  end

  def show
    @newsarticle = Newsarticle.find(params[:id])
  end

  def new
    @newsarticle = Newsarticle.new
  end

  def create
    @newsarticle = Newsarticle.create(newsarticle_params)
    if @newsarticle.save
      redirect_to newsarticle_path(@newsarticle), notice: "Successfully created newsarticle."
    else
      flash[:alert] = @newsarticle.errors.full_messages.join(' ')
      render :new
    end
  end

  def edit
    @newsarticle = Newsarticle.find(params[:id])
  end

  def update
    @newsarticle = Newsarticle.find(params[:id])
    if @newsarticle.update(newsarticle_params)
      redirect_to newsarticle_path(@newsarticle), notice: "Successfully updated newsarticle."
    else
      flash[:alert] = @newsarticle.errors.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    @newsarticle = Newsarticle.find(params[:id])
    @newsarticle.destroy
    redirect_to newsarticles_path, notice: "Successfully deleted newsarticle."
  end

  private

  def newsarticle_params
    params.required(:newsarticle).permit(:title, :body, :date, :link, :newsarticle_pic)
  end
end
