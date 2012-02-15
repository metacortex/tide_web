# == Schema Information
#
# Table name: categories
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  title       :string(255)
#  title_en    :string(255)
#  posts_count :integer(4)      default(0)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Category < ActiveRecord::Base
  
  has_many :posts, :dependent => :nullify
  has_many :tags, :dependent => :nullify
  
  validates_presence_of :name, :title
  validates_uniqueness_of :name


  attr_writer :tags_text
  
  def tags_text
    @tags_text || tags.map(&:name).join("\n")
  end



  protected
    
    after_save :save_tags
    
    def save_tags
      _tags = tags_text.split("\n").map(&:strip)

      tags.each do |t|
        if _tags.include?(t.name)
          # existing
          _tags.delete(t.name)
        else
          # removed
          t.update_attribute :category_id, nil
        end
      end

      _tags.each do |t|
        # new
        if tag = Tag.find_by_name(t)
          if tag.category_id != id
            tag.update_attribute :category_id, id
          end
        else
          Tag.create(:name => t, :category_id => id)
        end
      end
    end

end
