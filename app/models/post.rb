class Post < ActiveRecord::Base
  acts_as_taggable
  has_friendly_id :title, :use_slug => true
  
  has_many :comments, :as => :commentable
  has_many :post_resources
  accepts_nested_attributes_for :post_resources, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  
  define_index do
    indexes [:title, :teaser, :body],  :as => :keywords
    indexes tags.name,                 :as => :tags
    
    has created_at
    
    set_property                       :delta => true
  end
end
