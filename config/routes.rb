Rails.application.routes.draw do
  get 'refresh_notification_offer'=>'application#refresh_notification_offer', as: :refresh_notification_offer
  get 'refresh_notification_comment'=>'application#refresh_notification_comment', as: :refresh_notification_comment
  resources :addresses
  get 'my_address'=>'addresses#my_address', as: :my_address
  get 'users/show'
  get 'update_unread_comment'=>'requests#update_unread_comment'
  get 'add_new_address'=>'addresses#add_new_address', as: :add_new_address
  get 'commit_new_address'=>'addresses#commit_new_address', as: :commit_new_address
  get 'commit_reply_comment'=>'requests#commit_reply_comment', as: :commit_reply_comment
  resources :recommend_products
  resources :products

  get 'accept_offer' => 'requests#accept_offer', as: :accept_offer
  get 'decline_offer' => 'requests#decline_offer', as: :decline_offer
  
  get 'update_request_status' => 'management_controller#update_request_status', as: :update_request_status

  get 'offer_management'=>'management_controller#offer_management', as: :offer_management

  get 'user_management'=>'management_controller#user_management', as: :user_management

  get 'request_management' =>'management_controller#request_management', as: :request_management

  get 'offers/new'

  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }
  get 'portal/welcome'
  resources :users do
    resources :requests,  shallow: true
    resources :offers, shallow:true
  end
  resources :requests do
    resources :offers, shallow:true
  end
  resources :offers
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'portal#welcome'

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
