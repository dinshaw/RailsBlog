class PostSearch
  attr_accessor :tags, :keywords, :created_at
  def initialize(params)
    ['tags', 'keywords', 'created_at'].each do |p|
      eval <<-EOS
        self.#{p} = params[:#{p}] if !params[:#{p}].blank?
      EOS
    end
  end
  
  def conditions
    hash = {}
    hash[:tags] = tags if !tags.blank?
    hash
  end
end