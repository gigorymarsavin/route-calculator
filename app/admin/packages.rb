ActiveAdmin.register Package do
  permit_params :aasm_state, :name, :surname, :midname, :phone, :height, :length, :width, :weight, :price, :addr_to, :addr_from

  actions :index, :new, :create, :show, :destroy, :edit, :update

  form do |f|
    f.inputs :name, :surname, :midname, :phone, :height, :length, :width, :weight, :price, :addr_to, :addr_from
    f.inputs do
      f.input :aasm_state, :as => :select, :collection => ['processed', 'sent', 'delivered'], label: 'status'
    end
    f.actions
  end

  controller do
    def update
      default_aasm = resource.aasm_state
      update!
      if resource.aasm_state != default_aasm
        resource.aasm_state == 'delivered' ? resource.package_delivered! : nil
        resource.aasm_state == 'sent' ? resource.package_sent! : nil
      end
    end
  end

  index do
    column :id 
    column :name 
    column :surname 
    column :email 
    column :phone 
    column :size 
    column :addr_from
    column :addr_to
    state_column :aasm_state
    actions      
  end

end
