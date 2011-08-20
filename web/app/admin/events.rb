# encoding: UTF-8
ActiveAdmin.register Event do
  
  index do
    column :id
    column :name
    column :opened_at
    column :closed_at
    column :comments_count
    default_actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :name, :as => :string
      f.input :body, :as => :text
      f.input :opened_at
      f.input :closed_at
    end
    f.buttons
  end

end
