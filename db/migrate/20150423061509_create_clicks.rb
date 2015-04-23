class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.integer :shortened_link_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
