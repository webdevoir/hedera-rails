class Member < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :status
  has_many :member_publications, :dependent => :destroy
  has_many :publications, :through => :member_publications
  has_many :member_projects, :dependent => :destroy
  has_many :projects, :through => :member_projects
  has_attached_file :member_pic,
  styles: { medium: "250x250#" },
  default_url: "/assets/:style/missing.png"
  validates_attachment_content_type :member_pic, content_type: /\Aimage\/.*\Z/

  validates :name, presence: true
  validates :bibliography, format: URI::regexp(%w(http https)), allow_blank: true
  scope :filter_by_status, ->(status){ filter(status).order(:name) }

  private

  def self.filter(filter)
    if filter
      where(status_id: filter)
    end
  end
end
