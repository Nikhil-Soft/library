ActiveAdmin.register Author do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :phone_number, :bio
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :phone_number, :bio]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :name
    column :phone_number
    column :bio
    actions
  end

  show do |author|
    attributes_table do 
      row :name 
      row :phone_number
      row :bio
    end

    panel "Books" do 
      table_for author.books do 
        column :id 
        column :name do |book|
          link_to book.name, admin_book_path(book)
        end
        column :decription
        column :price
      end
    end
  end


  filter :books
  filter :name
  filter :phone_number
  filter :bio 
  
end
