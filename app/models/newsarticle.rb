class Newsarticle < ApplicationRecord

  has_attached_file :newsarticle_pic,
  styles: { small: "50x50#", medium: "225x150#", large: "450x300#" },
  default_url: "/images/:style/missing.png"

  has_attached_file :newsarticle_doc

  validates_attachment_content_type :newsarticle_pic, content_type: /\Aimage\/.*\Z/

  validates :title, :body, presence: true
  validates :link, format: URI::regexp(%w(http https)), allow_blank: true
end
