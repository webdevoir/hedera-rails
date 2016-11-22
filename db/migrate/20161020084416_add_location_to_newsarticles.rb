class AddLocationToNewsarticles < ActiveRecord::Migration[5.0]
  def change
    add_column :newsarticles, :location, :string
  end
end
