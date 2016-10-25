class RenameNewsCategoriesToPublicationCategories < ActiveRecord::Migration[5.0]
  def change
    rename_table :news_categories, :publication_categories
  end
end
