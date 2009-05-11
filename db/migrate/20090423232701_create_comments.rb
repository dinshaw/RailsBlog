class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :body
      t.integer :lft
      t.integer :rgt
      t.integer :parent_id
      t.integer :post_id
      t.boolean :spam
      t.string :name
      t.string :url
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
