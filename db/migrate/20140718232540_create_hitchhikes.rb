class CreateHitchhikes < ActiveRecord::Migration[4.2]
  def change
    create_table :hitchhikes do |t|
      t.string :name
      t.string :phone
      t.string :from
      t.string :hour
      t.string :comments
      t.boolean :taking

      t.timestamps
    end
  end
end
