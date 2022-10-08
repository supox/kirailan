class CreateApprovals < ActiveRecord::Migration[4.2]
  def change
    create_table :approvals do |t|
      t.string :name
      t.integer :guests
      t.string :comments

      t.timestamps
    end
  end
end
