# encoding: UTF-8
module PostsHelper
  
  def display_edit_status(s)
    msg = case s
    when nil
      "대기중"
    when "published"
    when "rejected"
      "거절"
    when "waiting"
      "재요청"
    else
      s
    end
    
    content_tag :span, "[#{msg}]", :class => "edit_status"
  end
  
end
