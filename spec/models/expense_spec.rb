require 'rails_helper'

RSpec.describe Expense, type: :model do
  it { should validate_presence_of(:spent_for) }
  it { should validate_presence_of(:amount) }
end
