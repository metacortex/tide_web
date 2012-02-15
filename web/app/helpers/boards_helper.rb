# encoding: UTF-8
module BoardsHelper

  def build_post_title(c)
    hs = []

    h1 = ""
    h1 += "[#{c.category}] " if c.category.present?
    h1 += c.title
    hs << link_to(h1.html_safe, board_post_path(c.board_id, c))

    if c.has_image?
      hs << "<span class=\"has_image\"><img src='/assets/bg/has_photo.jpg' /></span>"
    end
    
    if c.comments_count.to_i > 0
      hs << link_to("[#{c.comments_count}]", board_post_path(c.board_id, c), :class => "comments_count")
    end
    
    hs.join("\n").html_safe
  end

end
