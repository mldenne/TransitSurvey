class ChangeContentToTextField < ActiveRecord::Migration[5.0]
  def change
    change_column :textfiles, :content, :text
  end
end
