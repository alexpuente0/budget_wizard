class GroupsController < ApplicationController
before_action :authenticate_user!
  # before_action :set_group , only: %i[ show edit update destroy ]

  def index
    @groups = Group.all.where(user: current_user)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
      if @group.valid?
        @group.save
        flash[:notice] = "New Group was created."
      else
        flash[:alert] = "Group couldnt be created."
      end
      redirect_to groups_url
    end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:alert] = "Group has been Deleted."
    redirect_to groups_url
    
  end

  private

  def group_params
      params.require(:group).permit(:user, :name, :icon)
    end
end
