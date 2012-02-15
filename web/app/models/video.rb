# == Schema Information
#
# Table name: videos
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)
#  desc         :text
#  vimeo_uid    :string(255)
#  duration     :integer(4)
#  thumb_large  :string(255)
#  thumb_medium :string(255)
#  thumb_small  :string(255)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Video < ActiveRecord::Base

  validates_presence_of :vimeo_uid

  def vimeo_url
    "http://vimeo.com/#{vimeo_uid}"
  end


  private
    
    before_save :update_cache_columns

    def update_cache_columns
      if vimeo_uid_changed?
        v = Vimeo::Simple::Video.info(vimeo_uid).first
        self.title    = v["title"]
        self.desc     = v["description"]
        self.duration = v["duration"]
        self.thumb_large  = v["thumbnail_large"]
        self.thumb_medium = v["thumbnail_medium"]
        self.thumb_small  = v["thumbnail_small"]
      end
    end

end
