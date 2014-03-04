class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid
      t.boolean :refunded
      t.integer :amount
      t.string :currency
      t.timestamps
    end
  end
end
