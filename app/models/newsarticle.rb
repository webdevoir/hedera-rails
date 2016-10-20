class Newsarticle < ApplicationRecord

  has_attached_file :newsarticle_pic,
  styles: { small: "300x300#" },
  default_url: "/images/:style/missing.png"
  validates_attachment_content_type :newsarticle_pic, content_type: /\Aimage\/.*\Z/

  validates :title, :body, presence: true
  validates :link, format: URI::regexp(%w(http https)), allow_blank: true
end
