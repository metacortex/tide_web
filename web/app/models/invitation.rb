# == Schema Information
#
# Table name: invitations
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  email       :string(255)
#  kind        :string(255)
#  message     :text
#  code        :string(255)
#  accepted_at :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class Invitation < ActiveRecord::Base
  
  belongs_to :user

  scope :not_accepted, where("isNull(accepted_at)")

  validates_presence_of :email
  
  
  
  def accept!
    self.accepted_at ||= Time.now
    self.save
  end
  
  
  
  protected
    
    before_create :generate_code
    
    def generate_code
      self.code = SecureRandom.hex(16)
    end
  
end
