PmTool::Application.routes.draw do

  root 'welcome#index'

  resources :projects, :only => [:create, :destroy], :shallow => true do
    resources :products, :only => [:index]
    resources :works, :only => [:index]
    resources :resources, :only => [:index]
    resources :resource_allocations, :only => [:index]
    resources :efforts, :only => [:index]
  end

  # For ajax calls
  controller :products do
    post 'product', :to => :create
    patch 'product', :to => :move
    put 'product', :to => :update
    delete 'product', :to => :destroy
  end

  controller :works do
    post 'work', :to => :create
    patch 'work', :to => :move
    put 'work', :to => :update
    delete 'work', :to => :destroy
    get 'work/output', :to => :output
  end

  controller :resources do
    post 'resource', :to => :create
    patch 'resource', :to => :move
    put 'resource', :to => :update
    delete 'resource', :to => :destroy
    get 'resource', :to => :get
  end

  controller :resource_allocations do
    get 'resource_allocations', :to => :get
    get 'resource_allocations_select', :to => :select
    post 'resource_allocations', :to => :update
  end

  controller :efforts do
    delete 'efforts/:id/delete', :to => :destroy, :as => 'effort'
    post 'efforts', :to => :create
    get 'projects/:project_id/efforts/results', :to => :results, :as => 'efforts_results'
  end

  controller :milestones do
    get 'projects/:project_id/roadmap', :to => :index, :as => 'project_roadmap'
    post 'milestone', :to => :create
    delete 'milestone/:id/delete', :to => :destroy, :as => 'milestone_delete'
  end



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
