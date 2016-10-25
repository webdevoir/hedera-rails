class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.attachment :member_pic
      t.text :bio
      t.string :bibliography

      t.timestamps
    end
  end
end
