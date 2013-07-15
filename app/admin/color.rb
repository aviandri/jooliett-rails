ActiveAdmin.register Color do

controller do
    def permitted_params
      params.permit(:color => [:name, :hex])
    end
 end

end
