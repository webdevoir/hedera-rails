class AddSlugToNewsarticles < ActiveRecord::Migration[5.0]
  def change
    add_column :newsarticles, :slug, :string
    add_index :newsarticles, :slug, unique: true
  end
end
