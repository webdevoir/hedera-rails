class AddAttachmentProjectPicToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :project_pic
    end
  end

  def self.down
    remove_attachment :projects, :project_pic
  end
end
