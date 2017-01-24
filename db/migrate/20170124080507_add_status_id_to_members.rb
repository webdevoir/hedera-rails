class AddStatusIdToMembers < ActiveRecord::Migration[5.0]
  def change
    add_reference :members, :status, foreign_key: true
  end
end
