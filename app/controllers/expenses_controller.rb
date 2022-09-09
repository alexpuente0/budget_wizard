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
  end

  def create
    transaction = Expense.new(expense_params)
    transaction.group_id = params[:group_id]
    transaction.user = current_user
    if transaction.valid?
      transaction.save
      flash[:notice] = 'Expense created successfully'
    else
      flash[:alert] = "Expense could't be created"
    end
    redirect_to groups_url
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
