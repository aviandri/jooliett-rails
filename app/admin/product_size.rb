ActiveAdmin.register ProductSize do

controller do
    def permitted_params
      params.permit(:product_size => [:name, :description])
    end
 end

end
