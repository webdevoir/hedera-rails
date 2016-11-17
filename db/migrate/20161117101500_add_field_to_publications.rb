class AddFieldToPublications < ActiveRecord::Migration[5.0]
  def change
    add_column :publications, :external_authors, :string
    add_column :publications, :pages, :integer
    add_column :publications, :issue, :integer
    add_column :publications, :volume, :integer
    add_column :publications, :journal, :string
    add_column :publications, :congres, :string
    add_column :publications, :location_congres, :string
  end
end
