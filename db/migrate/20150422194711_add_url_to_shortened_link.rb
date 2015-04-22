class AddUrlToShortenedLink < ActiveRecord::Migration
  def change
    add_column :shortened_links, :url, :string
  end
end
