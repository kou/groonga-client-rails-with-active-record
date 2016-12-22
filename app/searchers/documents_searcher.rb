class DocumentsSearcher < ApplicationSearcher
  schema.column :title, {
    type: "ShortText",
    index: true,
    index_type: :full_text_search,
  }
  schema.column :content, {
    type: "Text",
    index: true,
    index_type: :full_text_search,
  }
  schema.column :tags, {
    type: "ShortText",
    reference: true,
    normalizer: false,
    vector: true,
    index: true,
  }
end
