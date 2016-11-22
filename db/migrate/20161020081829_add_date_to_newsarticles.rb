class AddDateToNewsarticles < ActiveRecord::Migration[5.0]
  def change
    add_column :newsarticles, :date, :date
  end
end
