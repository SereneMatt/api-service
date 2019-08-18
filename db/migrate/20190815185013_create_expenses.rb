class CreateExpenses < ActiveRecord::Migration[5.2]
  def up
    create_table :expenses do |t|
      t.string :spent_for
      t.decimal :amount
      t.boolean :pricy
      t.timestamps
    end
  end

  def down
    drop_table :expenses
  end
end
