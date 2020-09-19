class AddBooleanToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :allow_edit, :boolean
  end
end
