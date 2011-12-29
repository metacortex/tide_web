# encoding: UTF-8
module PostsHelper
  
  def display_edit_status(s)
    msg = case s
    when "published"
      "완료"
    when "rejected"
      "거절"
    when "waiting"
      "재요청"
    when "draft"
      "DRAFT"
    else
      nil
    end
    
    if msg
      content_tag :span, "[#{msg}]", :class => "edit_status"
    else
      ""
    end
  end
  
end
