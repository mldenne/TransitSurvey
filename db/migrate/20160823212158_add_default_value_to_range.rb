class AddDefaultValueToRange < ActiveRecord::Migration[5.0]
  def change
    change_column_default :communities, :range, 5 
  end
end
