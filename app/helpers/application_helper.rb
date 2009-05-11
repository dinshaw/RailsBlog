# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def page_title
    title = [h(SITE_NAME)]
    title << "|" << @post.title if @post
    title.join(" ")
  end
end
