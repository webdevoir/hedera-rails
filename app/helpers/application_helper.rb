module ApplicationHelper
  def options_for_publication_categories
    PublicationCategory.all.map { |category| [category.name, category.id] }
  end

  def options_for_project_categories
    ProjectCategory.all.map { |category| [category.name, category.id] }
  end

  def options_for_statuses
    Status.all.map { |status| [status.name, status.id] }
  end

  def format_publication(publication)
    "#{publication.authors} (#{publication.year}). #{publication.title}. #{publication.edition}."
  end
end
