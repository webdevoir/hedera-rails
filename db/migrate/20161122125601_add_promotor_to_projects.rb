class AddPromotorToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :promotor, :string
  end
end
