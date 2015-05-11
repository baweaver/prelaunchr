ActiveAdmin.register AdminUser do     
  index do                            
    column :phone_number                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 

  filter :phone_number

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :phone_number                  
      f.input :password               
      f.input :password_confirmation  
    end                               
    f.actions                         
  end                                 
end                                   
