# encoding: UTF-8
module UsersHelper
  
  def display_user_category(u)
    u.category.to_s.upcase
  end
  
  def display_user_category_icon(u)
    content_tag :div, (image_tag "type_#{u.category.to_s[0].downcase}.png"), :class => "category"
  end
  
end
