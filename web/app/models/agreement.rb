# == Schema Information
#
# Table name: agreements
#
#  id         :integer(4)      not null, primary key
#  post_id    :integer(4)
#  event_id   :integer(4)
#  comment_id :integer(4)
#  user_id    :integer(4)
#  direction  :integer(4)      default(0)
#  created_at :datetime
#  updated_at :datetime
#

class Agreement < ActiveRecord::Base
  
  belongs_to :comment, :counter_cache => true
  belongs_to :user
  
  validates_uniqueness_of :comment_id, :scope => :user_id


  def positive?
    direction > 0
  end
  
  def negative?
    direction < 0
  end
  
  
  
  protected
  
    before_save :update_counters
    
    def update_counters
      c_p = 0
      c_n = 0
      if new_record?
        if self.direction > 0
          c_p = 1
        elsif self.direction < 0
          c_n = 1
        end
      else
        if self.direction > 0 && self.direction_was < 0
          c_p = 1
          c_n = -1
        elsif self.direction < 0 && self.direction_was > 0
          c_p = -1
          c_n = 1
        end
        
      end
      Comment.update_counters comment_id, :positive_agreements_count => c_p, :negative_agreements_count => c_n
    end
  
  
end
