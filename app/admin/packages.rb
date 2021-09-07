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
    # This code is evaluated within the controller class

    def update
      default_aasm = resource.aasm_state
      update!
      resource.aasm_state != default_aasm ? PackageMailer.with(email: resource.email).send("#{resource.aasm_state}_status").deliver! : nil
    end
  end
end
