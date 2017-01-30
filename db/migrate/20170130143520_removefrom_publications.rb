class RemovefromPublications < ActiveRecord::Migration[5.0]
  def change
    remove_column :publications, :date
  end
end
