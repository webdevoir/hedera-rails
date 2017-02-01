class ChangeDatatypeInPublications < ActiveRecord::Migration[5.0]
  def change
    change_column :publications, :authors, :string
  end
end
