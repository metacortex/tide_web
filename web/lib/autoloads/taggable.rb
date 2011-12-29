module Taggable

  def self.included(m)
    m.has_many :taggings, :as => :content
    m.has_many :tags, :through => :taggings
    m.after_save :process_tag_string
  end

  attr_accessor :tag_string

  protected

    def process_tag_string
      @tag_string ||= ""
      _tags = @tag_string.split(",").map(&:strip)
    
      self.taggings.each do |t|
        if _tags.include?(t.tag_name)
          # existing
          _tags.delete(t.tag_name)
        else
          # removed
          t.destroy
        end
      end
    
      _tags.each do |t|
        # new
        self.taggings.create(:tag_name => t)
      end
    end

end
