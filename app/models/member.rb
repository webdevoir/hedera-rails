class Member < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :member_publications
  has_many :publications, :through => :member_publications
  has_many :member_projects
  has_many :projects, :through => :member_projects
  has_attached_file :member_pic,
  styles: { medium: "250x250#" },
  default_url: "/images/:style/missing.png"
  validates_attachment_content_type :member_pic, content_type: /\Aimage\/.*\Z/

  validates :name, presence: true
  validates :bibliography, format: URI::regexp(%w(http https)), allow_blank: true
end
