class UpdateDebtFields < ActiveRecord::Migration
  def change
    remove_column :debts, :paid
    add_column :debts, :marked_as_paid_by_creditor, :boolean
    add_column :debts, :marked_as_paid_by_debtor, :boolean
  end
end
