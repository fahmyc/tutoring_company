TutoringCompany::Application.routes.draw do
<<<<<<< HEAD
  devise_for :admins

  devise_for :tutors, :controllers => {:registrations => "registrations"}

  devise_for :students, :controllers => {:registrations => "registrations"}

  root :to => 'static_pages#home'

  resources   :students
  resources   :admins
  resources   :tutors
  resources   :contracts
  resources   :first_sessions
  resources   :matches
  resources   :tutor_sessions


  match 'admins/:id',       to: 'admins#show', as: "admin_home"
  match 'admins/:id/new_student', to: 'admins#new_student', as: 'new_student'
  match 'admins/:id/new_tutor', to: 'admins#new_tutor', as: 'new_tutor'
  match 'contract_edit/:admin_id/:student_id', to:'contracts#student_contract_edit', as: 'student_contract_edit'
  match 'admin/student_profile/:student_id', to:'admins#admin_student_profile', as: 'admin_student_profile'
  match 'contract/info/:contract_id', to:'contracts#contract_info', as: 'contract_info'
  match 'tutor_sessions/submit_hours/:tutor_id', to:'tutor_sessions#submit_hours', as: 'submit_hours'
  match 'first_session/:student_id', to:'first_sessions#first_session_submission', as:'first_session_submission'
  match 'student/student_sessions/:id', to: 'students#student_sessions', as: 'student_sessions'

  match 'tutor_sessions/weekly_sessions/:week_id', to:'tutor_sessions#weekly_sessions', as:'weekly_sessions'
  match 'tutors/your_students/:id', to:'tutors#your_students', as:'your_students'
  match 'tutors/your_tutors/:id', to:'students#your_tutors', as:'your_tutors'
  #buttons
  match '/first_session/:id/:student_id/10_hour_contract' => 'first_sessions#ten_hour', :as => 'update_10_hour_button'
  match '/first_session/:id/:student_id/20_hour_contract' => 'first_sessions#twenty_hour', :as => 'update_20_hour_button'
  match '/first_session/:id/:student_id/continue_no_contract' => 'first_sessions#continue_no_contract', :as => 'update_continue_no_contract_button'
  match '/first_session/:id/:student_id/not_to_continue' => 'first_sessions#not_to_continue', :as => 'update_not_to_continue_button'

  match '/contracts/:id/:student_id/paid' => 'contracts#paid', :as => 'paid_button'
  match '/contracts/:id/:student_id/not_paid' => 'contracts#not_paid', :as => 'not_paid_button'
  match '/contracts/:id/:student_id/cancelled' => 'contracts#cancelled', :as => 'cancelled_button'

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
