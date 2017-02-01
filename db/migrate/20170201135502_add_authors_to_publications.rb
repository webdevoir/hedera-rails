class AddAuthorsToPublications < ActiveRecord::Migration[5.0]
  def change
    add_column :publications, :authors, :string
  end
end
