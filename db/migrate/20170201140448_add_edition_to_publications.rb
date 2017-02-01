class AddEditionToPublications < ActiveRecord::Migration[5.0]
  def change
    add_column :publications, :edition, :string
  end
end
