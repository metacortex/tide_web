# encoding: UTF-8
ActiveAdmin.register Banner do
  
  index do
    column :id
    column :category
    column :event
    default_actions
  end

  filter :category

  form do |f|
    f.inputs do
      f.input :category
      f.input :event
    end
    f.buttons
  end

end
