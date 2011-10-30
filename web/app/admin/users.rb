# encoding: UTF-8
ActiveAdmin.register User do
  
  index do
    column :id
    column :name
    column :name_e
    column :email
    column :role
    column :category
    default_actions
  end

  filter :name
  filter :role, :as => :select, :collection => [nil, "staff", "writer", "editor"]
  filter :category

  form do |f|
    f.inputs do
      f.input :role, :as => :select, :collection => [nil, "staff", "writer", "editor"]
    end
    f.buttons
  end

end
