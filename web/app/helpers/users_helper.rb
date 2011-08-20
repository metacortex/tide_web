# encoding: UTF-8
module UsersHelper
  
  def display_user_category(u)
    u.category.to_s.upcase
  end
  
end
