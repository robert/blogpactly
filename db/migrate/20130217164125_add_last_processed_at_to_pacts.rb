class AddLastProcessedAtToPacts < ActiveRecord::Migration
  def change
    add_column :pacts, :last_processed_at, :datetime
  end
end
