class CreateTransports < ActiveRecord::Migration[4.2]
  def change
    create_table :transports do |t|
      t.string :name
      t.integer :direction
      t.string :comments
      t.string :phone

      t.timestamps
    end
  end
end
