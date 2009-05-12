class Comment < ActiveRecord::Base
  acts_as_nested_set :scope => [:commentable_id, :commentable_type]
  validates_presence_of :content
  belongs_to :commentable, :polymorphic => true
end
