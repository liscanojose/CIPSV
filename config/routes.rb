Rails.application.routes.draw do
 

  get '/signup' => 'usuarios#new'

  #************************************************************************************
  #************** Root
  root 'inicio#index'

#************************************************************************************
  #************** Plantilla del Front
  get 'inicio/index'

#************************************************************************************
  post '/login'  => 'sesion#create'
  get  '/logout' => 'sesion#destroy'

#************************************************************************************
  #******************************dashboard
    get '/dashboard' => 'dashboard#index'
    post '/dashboard' => 'dashboard#index'

  #************** Usuario
    #OMostrar Usuario
  get '/mostrarUsuario'  => 'usuarios#show'
  post '/mostrarUsuario'  => 'usuarios#show'

    #Olvido su Contraseña
  get '/resetPassword'  => 'password_resets#new'
  post '/resetPassword'  => 'password_resets#new'

  #************** Colaboradores
    #Registrar
  get '/registrarCoordinadorGeneral'  => 'usuarios#registrarCoordinadorG'
  post '/registrarCoordinadorGeneral'  => 'usuarios#registrarCoordinadorG'
      #Mostrar
  get '/mostrarCoordinadorGeneral'  => 'usuarios#mostrarCoordinadorG'
  post '/mostrarCoordinadorGeneral'  => 'usuarios#mostrarCoordinadorG'

  #************** Psicologos
    #Registrar
  get '/registrarPsicologo'  => 'usuarios#registrarPsicologo'
  post '/registrarPsicologo'  => 'usuarios#registrarPsicologo'
    #Mostrar
  get '/mostrarPsicologos'  => 'usuarios#mostrarPsicologos'
  post '/mostrarPsicologos'  => 'usuarios#mostrarPsicologos'

  #************** Psiquiatras
    #Registrar
  get '/registrarPsiquiatra'  => 'usuarios#registrarPsiquiatra'
  post '/registrarPsiquiatra'  => 'usuarios#registrarPsiquiatra'
      #Mostrar
  get '/mostrarPsiquiatras'  => 'usuarios#mostrarPsiquiatras'
  post '/mostrarPsiquiatras'  => 'usuarios#mostrarPsiquiatras'

  #************** Colaboradores
    #Registrar
  get '/registrarColaborador'  => 'usuarios#registrarColaborador'
  post '/registrarColaborador'  => 'usuarios#registrarColaborador'
      #Mostrar
  get '/mostrarColaboradores'  => 'usuarios#mostrarColaboradores'
  post '/mostrarColaboradores'  => 'usuarios#mostrarColaboradores'

  #************** Pacientes
    #Registrar
  get '/registrarPaciente'  => 'paciente#index'
  post '/registrarPaciente'  => 'paciente#index'
      #Mostrar
  get '/mostrarPacientes'  => 'paciente#mostrar_pacientes'
  post '/mostrarPacientes'  => 'paciente#mostrar_pacientes'
  
  #*********** Realizar Cuestionario
    #Frustraciones
  get '/realizar_cuestionario(/:id)' => 'paciente#realizar_cuestionario(/:id)'
  post '/realizar_cuestionario(/:id)' => 'paciente#realizar_cuestionario(/:id)'


  post '/create_cuestionario_demora' => 'cuestionario_demora#create'
  post '/create_cuestionario_conflicto' => 'cuestionario_conflicto#create'
  post '/create_cuestionario_impedimento' => 'cuestionario_impedimento#create'
  post '/create_cuestionario_tipo_frustracion' => 'cuestionario_tipo_frustracion#create'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
    #root 'sessions#create'

    resources :usuarios
    resources :paciente
    resources :cuestionario_tipo_frustracion
    resources :cuestionario_impedimento
    resources :cuestionario_demora
    resources :cuestionario_conflicto
    resources :account_activations, only: [:edit]
    resources :password_resets,     only: [:new, :create, :edit, :update]

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
  get ':controller(/:action(/:id))(.:format)'
  post ':controller(/:action(/:id))(.:format)'
end
