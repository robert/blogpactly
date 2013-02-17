class CreatePacts < ActiveRecord::Migration
  def change
    create_table :pacts do |t|

      t.timestamps
    end
  end
end
