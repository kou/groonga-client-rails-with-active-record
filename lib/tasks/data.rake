require "open-uri"
require "json"

namespace :data do
  namespace :load do
    desc "Load data from Qiita"
    task :qiita => :environment do
      tag = "groonga"
      url = "https://qiita.com/api/v2/items?page=1&per_page=100&query=tag:#{tag}"
      open(url) do |entries_json|
        entries = JSON.parse(entries_json.read)
        entries.each do |entry|
          tags = entry["tags"].collect do |tag|
            Tag.find_or_create_by(name: tag["name"])
          end
          Document.create(title:   entry["title"],
                          content: entry["body"],
                          tags:    tags)
        end
      end
    end
  end
end
