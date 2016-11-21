class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.create(project_params) 
    if @project.save
      redirect_to @project, notice: "Successfully created project."
    else
      flash[:alert] = @project.errors.full_messages.join(' ')
      render :new
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project, notice: "Successfully updated project."
    else
      flash[:alert] = @project.errors.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, notice: "Successfully deleted project."
  end

  private

  def project_params
    params.required(:project).permit(:title, :description, :contact, :email, :project_pic)
  end
end
