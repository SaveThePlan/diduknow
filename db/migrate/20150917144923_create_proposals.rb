class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :statement

      t.timestamps null: false
    end
  end
end
