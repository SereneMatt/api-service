class Api::V1::ExpensesController < ApplicationController
  # POST /expenses
  def create
    @expense = Expense.create!(expense_params)
    json_response(@expense, :created)
  end

  private

  def expense_params
    # whitelist params
    params.permit(:spent_for, :amount, :pricy)
  end
end
