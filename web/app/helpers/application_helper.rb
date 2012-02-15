# encoding: UTF-8
module ApplicationHelper

  #
  # Layout Helpers
  #
  
  def title(page_title)
    content_for(:title, page_title.to_s)  
  end
  
  def javascript(*args)
    content_for(:javascripts) { javascript_include_tag(*args) }
  end



  #
  # Current Path Helpers
  #
  
  def current_path?(rhs)
    if rhs
      if rhs.is_a?(Array)
        rhs.include?(request.path)
      elsif rhs.is_a?(Regexp)
        rhs.match(request.path) != nil
      else
        rhs == request.path
      end
    else
      false
    end
  end

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
      anchor_option = options.delete(:anchor_option) || {}
      @items << [@template.link_to(caption, path, anchor_option), options]
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
  
  def display_image(item, options)
    item_image = (item.class.to_s.downcase == "company")? item.logo_image : item.profile_image
    size = options[:size] || "profile_medium"
    
    src = if item && item_image && item_image.image
            item_image.image.url(size)
          else
            # ToDo: replace default image  
            "/assets/placeholder.png"
          end
    image_tag src, options
  end
  
  
  #
  # search/sort helper
  #
  
  def search_params(h)
    params[:q] ||= {}
    params.deep_merge({:q => h})
  end
  
  def current_search?(name, rhs)
    return false unless params[:q]

    v = params[:q][name]
    
    if rhs.is_a?(Array)
      rhs.include?(v)
    elsif rhs.is_a?(TrueClass)
      !v.blank?
    else
      rhs.to_s == v.to_s
    end
  end
  
  def merge_params(h)
    params.deep_merge({:q => params[:q]}.merge(h))
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
  # Pagination
  #
  
  def pagination_link(name, path)
    a = link_to(name, path, :remote => true)
    content_tag :div, a, :id => "pagination"
  end


  #
  # Tags
  #
  
  def display_tags(tags)
    tags.collect {|t| link_to(t.name) }.join(", ").html_safe
  end
  
  
  #
  # Nested Form
  #
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder).html_safe
    end
    link_to_function(name, h("add_fields(this, '#{association}', '#{escape_javascript(fields)}')".html_safe))
  end
  
  
  #
  # Image Upload Preview Form
  #
  def image_preview_form(f,c,image)
    if c.send(:"#{image.to_s}?")
      content_tag :div, :class => "attachment_preview" do
        image_tag(c.send(image).url) +
        f.input(:"remove_#{image.to_s}", :as => :boolean, :label => "이미지 삭제")
      end
    end
    
  end
  
  
  
  #
  # JS Scrollbar
  #
  def section_with_scrollbar(tag_name, options = {}, &block)
    content_tag tag_name, :class => "#{options[:class]} has_scrollbar" do
      concat('<div class="scrollbar"><div class="track"><div class="thumb"><div class="end"></div></div></div></div>'.html_safe)
      concat('<div class="viewport"><div class="overview">'.html_safe)
      yield block
      concat('</div></div>'.html_safe)
    end
  end




end
