module VisitCountable
  
  protected

    def increment_visit_count(obj)
      if new_visit?(obj.class.to_s, obj.id.to_s)
        obj.class.increment_counter(:pv_count, obj.id)
      end
    end
  
    def new_visit?(counter_key, counter_id)
      @store_size = 10
      @threshold = 3600 * 24 * 1 # 1 day
      @expire    = 3600 * 24 * 1 # 1 day
      
      now = Time.zone.now
      new_click = true
      
      cid = "_uc_#{counter_key}_#{counter_id.to_i % @store_size}".to_sym
      ck = cookies[cid] || ""
      cs = []

      # parse & remove old values
      ck.split("|").each do |c|
        s = c.split(".")
        next if s.size != 3

        t_diff = now - Time.at(s[1].to_i)
        if t_diff < @expire
          cs << s
        end
      end

      # a token: [post.id, created_at, duplicated_count]
      # check validity
      if (s = cs.detect {|t| t[0] == counter_id})
        t_diff = now - Time.at(s[1].to_i)

        if t_diff < @threshold
          new_click = false
        else
          s[1] = now.to_i
        end
        s[2] = s[2].to_i + 1
      else
        cs << [counter_id, now.to_i, 1]
      end

      # re-join values
      cookies[cid] = { :value => cs.collect {|t| t.join(".") }.join("|"), :expires => 1.month.from_now }
      new_click
    end

end
