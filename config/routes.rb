Portalprogramadores::Application.routes.draw do

  root :to => "sitio#index"

  match 'acerca_de' => 'sitio#acerca_de', :as => 'acerca_de'

  devise_for :usuarios do
    get "/iniciar_sesion", :to => "devise/sessions#new"
    get "/registrarse", :to => "devise/registrations#new"
    get "/cerrar_sesion", :to => "devise/sessions#destroy"
  end

  resources :preguntas do
    member do
      post 'guardar_respuesta', 'dar_voto', 'incrementar_vistas'
    end
    collection do
      get '/por/etiqueta/:id/:slug' => 'preguntas#mostrar_por_etiqueta', :as => 'mostrar_por_etiqueta'
    end
  end
  match 'preguntas/:id/:slug' => 'preguntas#show', :as => 'mostrar_pregunta'

  match '/preview_markitup', :to => redirect('/markitup/preview.html')
  match '/markitdown/preview', :to => "markitdown#preview"

  resources :codigos
  match 'codigos/:id/:slug' => 'codigos#show', :as => 'mostrar_codigo'

  resources :etiquetas do
    collection do
      get 'obtener_por_nombre'
    end
  end
  match 'etiquetas/:id/:slug' => 'etiquetas#show', :as => 'mostrar_etiqueta'

  resources :usuarios
  match 'usuarios/:id/:nombre' => 'usuarios#show', :as => 'mostrar_usuario'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
