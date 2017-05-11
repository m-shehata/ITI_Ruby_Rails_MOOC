ActiveAdmin.register Course do
    permit_params :title
  index do
    selectable_column
    id_column
    column :title
    column :created_at
    actions
  end
end
