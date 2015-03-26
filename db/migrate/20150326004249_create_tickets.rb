class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :sale, index: true
      t.references :user, index: true
      t.boolean :paid
      t.boolean :blocked

      t.timestamps null: false
    end
    add_foreign_key :tickets, :sales
    add_foreign_key :tickets, :users
  end
end
