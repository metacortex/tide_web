# encoding: UTF-8
ActiveAdmin.register Category do
  
  index do
    column :id
    column :name
    column :title
    column :title_en
    column :posts_count
    default_actions
  end

  filter :title

  form do |f|
    f.inputs do
      f.input :name, :as => :string, :hint => "ID입니다. 알파벳과 숫자로 입력해주세요."
      f.input :title, :as => :string, :label => "제목 (한국어)"
      f.input :title_en, :as => :string, :label => "제목 (English)"
    end
    f.buttons
  end

end
