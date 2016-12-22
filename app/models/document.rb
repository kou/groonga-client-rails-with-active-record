class Document < ApplicationRecord
  source = DocumentsSearcher.source(self)
  source.title = :title
  source.content = :content
end
