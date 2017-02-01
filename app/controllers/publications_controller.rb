class PublicationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :sort, :show]
  def index
    @publications = Publication.order(publication_category_id: :desc).order(created_at: :desc)
  end

  def sort
    @category = PublicationCategory.find_by_name(params[:category])
    @publications = Publication.sort_by_category(@category.id)
  end

  def show
    @publication = Publication.friendly.find(params[:id])
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.create(publication_params)
    if @publication.save
      redirect_to @publication, notice: "Successfully created publication."
    else
      flash[:alert] = @publication.errors.full_messages.join(' ')
      render :new
    end
  end

  def edit
    @publication = Publication.friendly.find(params[:id])
  end

  def update
    @publication = Publication.friendly.find(params[:id])
    if @publication.update(publication_params)
      redirect_to @publication, notice: "Successfully updated publication."
    else
      flash[:alert] = @publication.errors.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    @publication = Publication.friendly.find(params[:id])
    @publication.destroy
    redirect_to publications_path, notice: "Successfully deleted publication."
  end

  private

  def publication_params
    params.required(:publication).permit(:publication_category_id, :authors, :year, :title, :edition, :link)
  end
end
