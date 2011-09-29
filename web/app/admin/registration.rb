# encoding: UTF-8
ActiveAdmin.register Registration do

  index do
    column :name
    column :email
    column :phone
    column :status
    default_actions
  end

  filter :event_id

end
