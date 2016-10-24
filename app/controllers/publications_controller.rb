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
    end
  end

  private

  def publication_params
    params.required(:publication).permit(:title, :date, :year, :link)
  end
end
