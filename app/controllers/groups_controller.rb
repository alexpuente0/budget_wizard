class GroupsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_group , only: %i[ show edit update destroy ]

  def index
    @groups = Group.where(user: current_user)
  end

  def show
    @group = Group.find(params[:id])
    @expenses = @group.expenses.order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.valid?
      @group.save
      flash[:notice] = 'New Group was created.'
    else
      flash[:alert] = 'Group couldnt be created.'
    end
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:user, :name, :icon)
  end
end
