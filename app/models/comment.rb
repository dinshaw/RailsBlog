class Comment < ActiveRecord::Base
  acts_as_nested_set :scope => [:commentable_id, :commentable_type]
  validates_presence_of :body
  validates_presence_of :name
  belongs_to :commentable, :polymorphic => true, :counter_cache => true
end
