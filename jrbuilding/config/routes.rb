class AuthConstraint
  def matches?(request)
    request.session['user_id'].present?
  end

end

Rails.application.routes.draw do


  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"
  get "tenants/generate_lease" => "tenants#generate_lease"
  get "tenants/expense_addendum" => "tenants#expense_addendum"
  post "cheques/single_report" => "cheques#single_report"
  get "cheques/all_report" => "cheques#all_report"
  get "buildings/getgst" => "buildings#getgst"
  get "buildings/getqst" => "buildings#getqst"
  get "tenants/get_tenant_id" => "tenants#get_tenant_id"
  get "tenants/get_tenant_table" => "tenants#get_tenant_table"
  get "expenses/expensesforyear" => "expenses#expensesforyear"
  get "expenses/expenses_for_building" => "expenses#expenses_for_building"
  get "buildings/properties_for_building" => "buildings#properties_for_building"
  get "tenants/tenants_in_local" => "tenants#tenants_in_local"
  get "helps/download_master_lease"
  get "helps/download_master_expense" => "helps#download_master_expense"
  post "tenants/send_mail" => "tenants#send_mail"

  root :to => 'buildings#index', :constraints => AuthConstraint.new, as: :authenticated_root
  root :to => 'sessions#new'

  resources :users
  resources :buildings
  resources :properties
  resources :tenants
  resources :sessions 
  resources :expenses
  resources :masterleasepdfforms
  resources :expensepdfforms  
  resources :helps
  resources :cheques  
  match '*path', :to => 'errors#routing', via: [:get, :post]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
