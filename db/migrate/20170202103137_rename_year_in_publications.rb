class RenameYearInPublications < ActiveRecord::Migration[5.0]
  def change
    rename_column :publications, :year, :publication_year
  end
end
