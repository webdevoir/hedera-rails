class Publication < ApplicationRecord
  validates :title, :date, :year, presence: true
  validates :year, numericality: true
  validates :link, format: URI::regexp(%w(http https)), allow_blank: true
end
