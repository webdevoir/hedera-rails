class AddTitleToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :title, :string
  end
end
