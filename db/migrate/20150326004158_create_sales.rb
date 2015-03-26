class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.datetime :start
      t.datetime :end
      t.integer :quantity
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :sales, :users
  end
end
