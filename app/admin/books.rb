ActiveAdmin.register Book do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :author_id, :name, :decription, :price
  #
  # or
  #
  # permit_params do
  #   permitted = [:author_id, :name, :decription, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


  index do
    selectable_column
    id_column
    column :author
    column :name
    column :decription
    column :price
    actions
  end

  show do 
    attributes_table do 
      row :author
      row :name 
      row :decription
      row :price 
    end
  end


  filter :author
  filter :name
  filter :decription
  filter :price 

  
end
