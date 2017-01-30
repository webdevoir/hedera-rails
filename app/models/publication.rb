class Publication < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :publication_category
  validates :title, presence: true
  validates :link, format: URI::regexp(%w(http https)), allow_blank: true
  scope :sort_by_category, ->(category_id){ all.where(publication_category_id: category_id).order('created_at desc') }
  scope :grouped_by_year, ->{ order(year: :desc).group_by { |p| p.year} }
end
