class Expense < ApplicationRecord
  validates_presence_of :spent_for, :amount
end
