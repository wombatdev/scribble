Rails.application.routes.draw do

    root to: 'posts#index'
    # get '/comments', to: 'comments#index'
    resources :posts do
        resources :comments
    end
    resources :posts do
        resources :tags
    end
    resources :categories do
        resources :tags
    end

    resources :posts do
        member do
            post 'bump_up'
            post 'bump_down'
        end
    end

    resources :tags do
        member do
            post 'add_tag'
        end
    end

end
