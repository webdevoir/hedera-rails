class MembersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @members = Member.all.order(name: :desc)
  end 

  def show
    @member = Member.friendly.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.create(member_params)
    if @member.save
      redirect_to @member, notice: "Successfully created member."
    else
      flash[:alert] = @member.errors.full_messages.join(' ')
      render :new
    end
  end

  def edit
    @member = Member.friendly.find(params[:id])
  end

  def update
    @member = Member.friendly.find(params[:id])
    if @member.update(member_params)
      redirect_to @member, notice: "Successfully updated member."
    else
      flash[:alert] = @member.errors.full_messages.join(' ')
      render :edit
    end
  end

  def destroy
    @member = Member.friendly.find(params[:id])
    @member.destroy
    redirect_to members_path, notice: "Successfully deleted member."
  end

  private

  def member_params
    params.required(:member).permit(:name, :title, :email, :phone, :address, :bio, :bibliography, :member_pic, :project_ids => [])
  end
end
