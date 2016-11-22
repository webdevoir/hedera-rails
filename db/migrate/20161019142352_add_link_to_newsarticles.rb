class AddLinkToNewsarticles < ActiveRecord::Migration[5.0]
  def change
    add_column :newsarticles, :link, :string
  end
end
