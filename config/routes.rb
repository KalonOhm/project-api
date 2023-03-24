# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'paint_scheme_paints/index'
      get 'paint_scheme_paints/show'
      get 'paint_scheme_paints/create'
      get 'paint_scheme_paints/update'
      get 'paint_scheme_paints/destroy'
      get 'paint_schemes/index'
      get 'paint_schemes/show'
      get 'paint_schemes/create'
      get 'paint_schemes/update'
      get 'paint_schemes/destroy'
      get 'minis/index'
      get 'minis/show'
      get 'minis/create'
      get 'minis/update'
      get 'minis/destroy'
      get 'subgroups/index'
      get 'subgroups/show'
      get 'subgroups/create'
      get 'subgroups/update'
      get 'subgroups/destroy'
      get 'groups/index'
      get 'groups/show'
      get 'groups/create'
      get 'groups/update'
      get 'groups/destroy'
      get 'collections/index'
      get 'collections/show'
      get 'collections/create'
      get 'collections/update'
      get 'collections/destroy'
      get 'paints/index'
      get 'paints/show'
      get 'paints/create'
      get 'paints/update'
      get 'paints/destroy'
    end
  end
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  require 'sidekiq/web'

  scope :monitoring do
    # Sidekiq Basic Auth from routes on production environment
    if Rails.env.production?
      Sidekiq::Web.use Rack::Auth::Basic do |username, password|
        ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username),
                                                    ::Digest::SHA256.hexdigest(Rails.application.credentials.sidekiq[:auth_username])) &
          ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password),
                                                      ::Digest::SHA256.hexdigest(Rails.application.credentials.sidekiq[:auth_password]))
      end
    end
    mount Sidekiq::Web, at: '/sidekiq'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # user routes
      namespace :users do
        post :login
        delete :logout
        get :me
        post :create
        put :update
        delete :destroy

      # collection routes
        resources :collections, only: %i[index show create update destroy] do
        # group routes nested under collections
          resources :groups, only: %i[index show create update destroy] do
          # subgroup routes nested under groups
            resources :subgroups, only: %i[index show create update destroy] do
            # model resources nested under subgroups
              resources :models, only: %i[index show create update destroy] 
            end
          end
        end
      end
    # paint scheme routes 
      resources :paint_schemes, only: %i[index show create update destroy] do
        # paint_scheme_paint routes nested under paint_schemes
        resources :paint_scheme_paints, only: %i[index show create update destroy] do
        end
      end
    # paint routes
    resources :paints, only: %i[index show create update destroy]
    
    end
  end
end
