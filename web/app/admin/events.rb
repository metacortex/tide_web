# encoding: UTF-8
ActiveAdmin.register Event do
  
  index do
    column :id
    column :name
    column :opened_at
    column :closed_at
    column :comments_count
    column :status
    default_actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :name, :as => :string
      f.input :poster_image, :as => :file
      f.input :thumb_image, :as => :file
      f.input :picture_image, :as => :file
      f.input :abbr, :as => :text
      f.input :body, :as => :text
      f.input :opened_at
      f.input :closed_at
      f.input :status, :as => :select, :collection => ["closed", "ended"]
    end
    f.buttons
  end

end
