class CreatePactsUsers < ActiveRecord::Migration
  def change
    create_table :pacts_users, id: false do |t|
      t.integer :pact_id
      t.integer :user_id
    end
    add_index :pacts_users, :pact_id
    add_index :pacts_users, :user_id
  end
end
