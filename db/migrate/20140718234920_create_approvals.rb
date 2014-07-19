class CreateApprovals < ActiveRecord::Migration
  def change
    create_table :approvals do |t|
      t.string :name
      t.integer :guests
      t.string :comments

      t.timestamps
    end
  end
end
