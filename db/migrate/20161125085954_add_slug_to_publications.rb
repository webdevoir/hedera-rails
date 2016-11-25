class AddSlugToPublications < ActiveRecord::Migration[5.0]
  def change
    add_column :publications, :slug, :string
    add_index :publications, :slug, unique: true
  end
end
