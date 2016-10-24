class PublicationsController < ApplicationController
  def index
    @publications = Publication.all
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.create(publication_params)
    if @publication.save
      redirect_to publication_path(@publication), notice: "Successfully created publication."
    else
      flash[:alert] = @publication.errors.full_messages.join(' ')
      render :new
    end
  end

  def edit
    @publication = Publication.find(params[:id])
  end

  def update
    @publication = Publication.find(params[:id])
    if @publication.update(publication_params)
      redirect_to publication_path(@publication), notice: "Successfully updated publication."
    else
      flash[:alert] = @publication.errors.full_messages.join(' ')
      render :edit
    end
  end

  private

  def publication_params
    params.required(:publication).permit(:title, :date, :year, :link)
  end
end
