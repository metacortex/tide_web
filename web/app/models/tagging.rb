# == Schema Information
#
# Table name: taggings
#
#  id           :integer(4)      not null, primary key
#  content_type :string(255)
#  content_id   :integer(4)
#  name         :string(255)
#  category     :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Tagging < ActiveRecord::Base
  
  belongs_to :tag
  belongs_to :user
  belongs_to :post



  protected
  
    before_create :check_tag
    
    def check_tag
      if tag_id.nil?
        if tag = Tag.find_by_name(name)
        else
          tag = Tag.create(:name => name)
        end
        self.tag_id = tag.id
      end
    end
  
end
