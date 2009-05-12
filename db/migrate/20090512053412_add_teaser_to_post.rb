class AddTeaserToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :teaser, :text
  end

  def self.down
    remove_column :posts, :teaser
  end
end
