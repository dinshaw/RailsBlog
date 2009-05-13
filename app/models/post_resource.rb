class PostResource < ActiveRecord::Base
  acts_as_list :scope => :post_id
  validates_presence_of :title
  validates_presence_of :url
  
  default_scope :order => 'position asc'
end
