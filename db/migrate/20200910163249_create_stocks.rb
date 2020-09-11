class CreateStocks < ActiveRecord::Migration

  def change
    create_table :stocks do |t|
      t.string :name #company_name
      t.string :ticker_symbol
      t.real :current_price
      t.timestamps null: false
    end
  end

  def clear
    drop_table :stocks
  end
end
