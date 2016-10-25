class Publication < ApplicationRecord
  belongs_to :publication_category
  validates :title, :date, :year, presence: true
  validates :year, numericality: true
  validates :link, format: URI::regexp(%w(http https)), allow_blank: true
end
