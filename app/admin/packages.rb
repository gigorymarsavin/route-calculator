ActiveAdmin.register Package do
  permit_params :aasm_state, :name, :surname, :midname, :phone, :height, :length, :width, :weight, :price, :addr_to, :addr_from

  form do |f|
    f.inputs :name, :surname, :midname, :phone, :height, :length, :width, :weight, :price, :addr_to, :addr_from
    f.inputs do
      f.input :aasm_state, :as => :select, :collection => ['processed', 'sent', 'finished'], label: 'status'
    end
    f.actions
  end
end 
