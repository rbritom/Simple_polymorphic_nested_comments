class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :author
      t.text :content
      t.string :commentable_type
      t.integer :commentable_id
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.timestamps
    end
  end
  
  def self.down
    drop_table :comments
  end
end
