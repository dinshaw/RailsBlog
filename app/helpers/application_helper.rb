# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def page_title
    title = [h(SITE_NAME)]
    title << "|" << @post.title if @post
    title.join(" ")
  end

  def rnst(text)
    textilize( parse_coderay(text) )
  end

  def parse_coderay(text)
    return false unless text
    text.scan(/(<code\:([a-z].+?)>(.+?)<\/code>)/m).each do |match|
      text.gsub!(match[0],CodeRay.scan(match[2].strip, match[1].to_sym).div(:css => :class))
    end
    text
  end
  
  def superuser? 
    logged_in? && current_user.has_role('superuser')
    true
  end
  
  def tag_list(thing)
    thing.tags.map{ |t| link_to(t,"") }.to_sentence
    
  end
end
