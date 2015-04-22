class CreateShortenedLinks < ActiveRecord::Migration
  def change
    create_table :shortened_links do |t|
      t.string :encoded_string
      t.integer :base

      t.timestamps null: false
    end
  end
end
