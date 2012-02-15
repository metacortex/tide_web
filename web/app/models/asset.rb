# == Schema Information
#
# Table name: assets
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  source     :string(255)
#  attachment :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Asset < ActiveRecord::Base
  
  validates_presence_of :name
  
  mount_uploader :attachment, AssetUploader


end
