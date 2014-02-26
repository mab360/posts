class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.boolean :promote, :default => false
      t.integer :clicks, :default => 0

      t.timestamps
    end
  end
end
