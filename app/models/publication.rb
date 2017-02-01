class Publication < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
   
  def should_generate_new_friendly_id?
    title_changed?
  end

  belongs_to :publication_category
  validates :authors, :year, :title, presence: true
  validates :year, numericality: true
  validates :link, format: URI::regexp(%w(http https)), allow_blank: true
  scope :sort_by_category, ->(category_id){ all.where(publication_category_id: category_id).order('created_at desc') }
  scope :grouped_by_year, ->{ order(year: :desc).group_by { |p| p.year} }
end
