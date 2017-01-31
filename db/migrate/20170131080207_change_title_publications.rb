class ChangeTitlePublications < ActiveRecord::Migration[5.0]
  def change
    change_column :publications, :title, :text
  end
end
