# encoding: UTF-8
module BoardsHelper

  def build_post_title(c)
    hs = []

    h1 = ""
    h1 += c.title
    hs << link_to(h1.html_safe, board_path(c))

    # if c.has_image?
    #   hs << "<span class=\"has_image\"><img src='/assets/bg/has_photo.jpg' /></span>"
    # end
    # 
    # if c.comments_count.to_i > 0
    #   hs << link_to("[#{c.comments_count}]", board_path(c), :class => "comments_count")
    # end
    
    hs.join("\n").html_safe
  end

  def display_post_time(tt)
    if Time.zone.now.to_date == tt.to_date
      l(tt, :format => :time_only)
    else
      l(tt.to_date)
    end
  end
  
end
