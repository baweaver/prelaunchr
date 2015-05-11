# Export to CSV with the referrer_id
ActiveAdmin.register User do
  csv do
    column :id
    column :phone_number
    column :referral_code
    column :referrer_id
    column :created_at
    column :updated_at
  end

  actions :index, :show
  
end
