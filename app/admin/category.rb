ActiveAdmin.register Category do

form do |f|
	f.inputs do
		f.input :name
		f.input :type, :as => :select, :collection => ["Type", "Event"]			
	end
	f.actions
end

index do       
	column :id
	column :created_at
	column :updated_at
	column :name
	column :type
	default_actions        
end

controller do
    def permitted_params
      params.permit(:category => [:name, :type])
    end
 end

end
