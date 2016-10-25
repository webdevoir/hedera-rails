class AddPublicationCategoryToPublications < ActiveRecord::Migration[5.0]
  def change
    add_reference :publications, :publication_category, foreign_key: true
  end
end
