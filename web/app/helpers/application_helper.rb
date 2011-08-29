# encoding: UTF-8
module ApplicationHelper


  #
  # Current Path Helpers
  #

  def current_controller?(rhs)
    if rhs
      if rhs.is_a?(Array)
        rhs.include?(params[:controller])
      elsif rhs.is_a?(Regexp)
        rhs.match(params[:controller]) != nil
      else
        rhs == params[:controller]
      end
    else
      false
    end
  end

  def current_action?(rhs)
    if rhs
      if rhs.is_a?(Array)
        rhs.include?(params[:action])
      elsif rhs.is_a?(Regexp)
        rhs.match(params[:action]) != nil
      else
        rhs == params[:action]
      end
    else
      false
    end
  end

  def current_param?(param_name, rhs)
    v = params[param_name]
    
    if rhs.is_a?(Array)
      rhs.include?(v)
    else
      rhs == v
    end
  end


  #
  # Navigation Tag Helpers
  #

  def navigation_tag(options = {}, &block)
    b = NavigationBuilder.new(self, options)
    yield b
    concat(b.to_html) unless b.empty?
    nil
  end
  
  class NavigationBuilder
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::CaptureHelper
    
    def initialize(template, options = {})
      @template = template
      @items = []
      @container_id = options.delete(:id)
      @container_class = options.delete(:class)
      @spacer = options.delete(:spacer) || "\n"
    end
    
    def empty?
      @items.empty?
    end
    
    def item(caption, path, options = {})
      @items << [@template.link_to(caption, path), options]
      nil
    end
    
    def item_wrapper(content, options = {})
      classes = [] 
      html_option = options.delete(:html) || {}
      classes << html_option.delete(:class)
      classes << "first"   if @items.first[0] == content
      classes << "last"    if @items.last[0] == content
      classes << "current" if options.delete(:current)
      html_option[:class] = classes.join(" ") unless classes.empty?
      content_tag :li, content, html_option
    end
    
    def build
      content_tag :ul, @items.collect{|t| item_wrapper(*t)}.join(@spacer).html_safe, :id => @container_id, :class => @container_class
    end
    
    alias :to_html :build
  end


  #
  # View Helpers
  #
  
  def render_notice_message
    if flash[:notice]
      "<div class='notice'><div class=''>#{flash[:notice]}</div></div>".html_safe
    end
  end
  
  def display_none_if(cond)
    if cond
      "display:none"
    else
      nil
    end
  end
  
  def text_with_linebreak(txt)
    txt.to_s.gsub("\n","<br/>").html_safe
  end
  

end
