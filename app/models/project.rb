class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :project_category
  has_many :member_projects, :dependent => :destroy
  has_many :members, :through => :member_projects
  validates :title, :description, presence: true

  has_attached_file :project_pic,
  styles: { large: "450x300#" },
  default_url: "/images/:style/missing.png"

  validates_attachment_content_type :project_pic, content_type: /\Aimage\/.*\Z/
  validates :link, format: URI::regexp(%w(http https)), allow_blank: true

end
