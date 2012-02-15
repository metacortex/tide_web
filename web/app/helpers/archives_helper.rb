# encoding: UTF-8
module ArchivesHelper

  def display_duration(n)
    n ||= 0
    min = (n / 60).to_i
    sec = n % 60
    
    sec = "0#{sec}" if sec < 10
    
    "<span class='duration'>#{min}:#{sec}</span>".html_safe
  end
  
  def embed_video(v, width = 533, height = 300)
    "<iframe src=\"http://player.vimeo.com/video/#{v.vimeo_uid}\" width=\"#{width}\" height=\"#{height}\" frameborder=\"0\" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>".html_safe
  end

end
