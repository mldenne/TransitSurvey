class AddSlugToCommunities < ActiveRecord::Migration[5.0]
  def change
    add_column :communities, :slug, :string, unique: true
  end
end
