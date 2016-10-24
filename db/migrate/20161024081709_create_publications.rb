class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.string :title
      t.date :date
      t.integer :year
      t.string :link
      t.timestamps
    end
  end
end
