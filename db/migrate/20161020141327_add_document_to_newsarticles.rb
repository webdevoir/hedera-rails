class AddDocumentToNewsarticles < ActiveRecord::Migration[5.0]
  def self.up
    change_table :newsarticles do |t|
      t.attachment :newsarticle_doc
    end

    def self.down
      remove_attachment :newsarticles, :newsarticle_doc
    end
  end
end
