class AddNewsarticlePicToNewsarticles < ActiveRecord::Migration[5.0]
  def self.up
    change_table :newsarticles do |t|
      t.attachment :newsarticle_pic
    end

    def self.down
      remove_attachment :newsarticles, :newsarticle_pic
    end
  end
end
