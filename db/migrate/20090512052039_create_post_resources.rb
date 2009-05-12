class CreatePostResources < ActiveRecord::Migration
  def self.up
    create_table :post_resources do |t|
      t.string :title
      t.string :url
      t.integer :post_id
      t.integer :position
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :post_resources
  end
end
