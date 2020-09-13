class CreateStocks < ActiveRecord::Migration

  def change
    create_table :stocks do |t|
      t.string :name
      t.string :ticker_symbol
      t.string :category
      t.float :price
      t.timestamps null: false
    end
  end

  def clear
    drop_table :stocks
  end
end
