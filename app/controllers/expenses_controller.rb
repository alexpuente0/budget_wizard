class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @expenses = Expense.where(group_id: params[:group_id], user: current_user).order('created_at DESC')
  end

  def show
    @expense = Expense.find(params[:expense_id])
    @group = Group.find(params[:group_id])
  end

  def new
    @expense = Expense.new
    @group = Group.find(params[:group_id])
    @groups = Group.where(user_id: current_user.id)
  end

  def create
    @transaction = Expense.new(expense_params)
    @transaction.user = current_user
    @group = Group.find(params[:group_id])
    if params[:group_ids]
      params[:group_ids].each do |group_id|
        group = Group.find(group_id)
        group.expenses << @transaction
      end
      redirect_to @group
    else
      redirect_to new_group_expense_path(@group), flash[:alert] = 'Select at least one Category'
      nil
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
