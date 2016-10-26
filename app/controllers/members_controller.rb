class MembersController < ApplicationController
  def index
    @members = Member.all
  end 

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.create(member_params)
    if @member.save
      redirect_to member_path(@member), notice: "Successfully created member."
    else
      flash[:alert] = @member.errors.full_messages.join(' ')
      render :new
    end
  end

  private

  def member_params
    params.required(:member).permit(:name, :title, :email, :phone, :address, :bio, :bibliography, :member_pic)
  end
end
