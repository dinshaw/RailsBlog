class AddDeltaPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :delta, :boolean
  end

  def self.down
    remove_column :posts, :delta
  end
end
