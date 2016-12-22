class Document < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings

  source = DocumentsSearcher.source(self)
  source.title = :title
  source.content = :content
  source.tags = ->(model) do
    model.tags.collect(&:name)
  end
end
