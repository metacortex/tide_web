module Stampable

  def self.included(m)
    m.extend(ClassMethods)
    # m.include(InstanceMethods)
    m.after_create :make_create_stamp
    m.after_update :make_update_stamp
    m.after_destroy :make_destroy_stamp
  end


  module ClassMethods
    def mount_stamper(actor_method, parent_target = nil)
      @stamper_actor_method = actor_method
      @stamper_parent_target = parent_target
    end

    def stamper_actor_method
      @stamper_actor_method
    end
    def stamper_parent_target
      @stamper_parent_target
    end
  end

  def make_stamp(action, desc = nil)
    actor_method = self.class.stamper_actor_method
    parent_target = self.class.stamper_parent_target
    
    ut = UserStamp.new
    ut.user_id = send(actor_method)
    ut.content = self
    ut.parent_content = send(parent_target) if parent_target
    ut.action = action.to_s
    ut.desc = desc
    ut.save
  end
  
  def make_create_stamp
    make_stamp("create")
  end
  
  def make_update_stamp
    make_stamp("update")
  end
  
  def make_destroy_stamp
    make_stamp("destroy")
  end

  
end

# ActiveRecord::Base.send(:include, Stampable) if defined?(ActiveRecord)
