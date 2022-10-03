ActiveAdmin.register Actor do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :movies_count, :age, :experiences, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :movies_count, :age, :experiences]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :name
    column :age
    column :experiences
    actions
  end


  show do
    attributes_table do
      
      row :name
      row :age
      row :experiences
      row :image  do |actor|
        ul do
          actor.pictures.each do |picture|
            li do 
              image_tag (picture.image), size: "100x100", style: "object-fit:cover"
           end
          end
        end
      end  

    end
  end


  # show do


    # row "Images" do
    #   ul do
    #      actor.pictures.each do |picture|
    #       li do 
    #         image_tag(picture.image.url(:small))
    #       end
    #      end
    #   end
    # end
    # image_tag actor.pictures

      # column "Image" do |actor|
      #   image_tag actor.pictures.image
      # end
  # end


  filter :name
  filter :pictures
  filter :age 
  filter :experiences

  
end
