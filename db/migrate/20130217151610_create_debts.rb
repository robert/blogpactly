class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.integer :debtor_id
      t.integer :creditor_id
      t.integer :pact_id
      t.integer :amount
      t.boolean :paid

      t.timestamps
    end
  end
end
