module ScopeSearchable

  def self.included(m)
    m.extend(ClassMethods)
  end


  module ClassMethods
    def search_scope(scope_name)
      r = self
      unless scope_name.blank?
        r = r.send(scope_name)
      end
      r
    end
  end


end
