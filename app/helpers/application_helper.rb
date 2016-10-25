module ApplicationHelper
  def options_for_publication_categories
    PublicationCategory.all.map { |category| [category.name, category.id] }
  end
end
