ActiveAdmin.register Event do
  permit_params :title, :description, :location, :starts_at, :ends_at, :image

  index do
    selectable_column
    id_column
    column :title
    column :location
    column :starts_at
    column :ends_at
    actions
  end

  filter :title
  filter :location

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :location
      f.input :starts_at
      f.input :ends_at
      f.input :image
    end
    f.actions
  end

end
